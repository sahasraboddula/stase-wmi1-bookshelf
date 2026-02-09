# Detecting UAF using KLEE in 2-bookshelf
**Vulnerability:** WMI-1 (Stale Reference Creation) in the context of 2-bookshelf. This vulnerability is created by deleting an author and freeing the author but not freeing the books that reference them, creating a stale pointer.

**Steps:**
```
./stub.sh
./build.sh
bash run.sh
```
1. Run ./stub.sh to generate the file stubs_demo.c
2. Run ./build.sh to generate the file uaf_demo.bc. build.sh and run.sh were edited to fit the filenames and requirements for 2-bookshelf.
3. Run bash run.sh to run KLEE.

**Results:**
```
root@SB-Laptop:~/2-bookshelf/demo_klee# bash run.sh
+ klee --search=bfs --max-time=30s --exit-on-error-type=Assert uaf_demo.bc
KLEE: output directory is "/root/2-bookshelf/demo_klee/klee-out-1"
KLEE: Using STP solver backend
KLEE: SAT solver: MiniSat
KLEE: Deterministic allocator: Using quarantine queue size 8
KLEE: Deterministic allocator: globals (start-address=0x7956cae00000 size=10 GiB)
KLEE: Deterministic allocator: constants (start-address=0x79544ae00000 size=10 GiB)
KLEE: Deterministic allocator: heap (start-address=0x78544ae00000 size=1024 GiB)
KLEE: Deterministic allocator: stack (start-address=0x78344ae00000 size=128 GiB)
KLEE: WARNING ONCE: Alignment of memory from call "malloc" is not modelled. Using alignment of 8.
KLEE: ERROR: driver_uaf_demo.c:44: check_memory_access: memory error
KLEE: NOTE: now ignoring this error at this location

KLEE: done: total instructions = 2313792
KLEE: done: completed paths = 0
KLEE: done: partially completed paths = 128
KLEE: done: generated tests = 1
+ echo '[OK] KLEE finished; see klee-out-* for errors/tests'
[OK] KLEE finished; see klee-out-* for errors/tests
```
KLEE was successfully able to detect the stale reference caused by the line: 
```
if (bk) {
  klee_check_memory_access(bk, sizeof(author));
}
```

### Explanation of driver file
Variables relating to the author and the book, such as author name and book name are made symbolic. Duplicate pointers to the book and author are made and the original ones are deleted. 
Then, we try to access the author through the new book pointer and check using: klee_check_memory_access(bk, sizeof(author)).

