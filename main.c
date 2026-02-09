#include <stdio.h>
#include <stdbool.h>
#include <unistd.h>
#include <malloc.h>
#include "bookshelf.h"

#define CHAOS_RULES   1

enum menu_options {
    M_PRINT_AUTHORS = 0,
    M_PRINT_BOOKS,  
    M_NEW_AUTHOR,
    M_NEW_BOOK,
    M_NEW_REVIEW,
    M_DELETE_AUTHOR,
    M_DELETE_BOOK,
    M_EXIT,
    M_SHOW_HEAP,
    M_OPTION_CNT
};

typedef void (*func_t)(void);

// MENU FUNCTION OPTIONS
void menu_create_review();
void menu_print_authors();
void menu_create_author();
void menu_delete_author();
void menu_print_books();
void menu_create_book();
void menu_delete_book();
void menu_show_heap();
void menu_exit();

int  mistake_counter = 0;

// SOME DESCRIPTIONS
char desc_tolk[] = \
"J.R.R. Tolkien is best known for his epic high-fantasy novels The Hobbit \
and The Lord of the Rings, which are set in the fictional world of Middle-earth \
and follow heroic quests involving hobbits, wizards, dwarves, and elves. Tolkien, \
a professor of Anglo-Saxon literature, also created numerous fictional languages \
and detailed histories of Middle-earth, contributing to its rich and immersive \
qualities. His works explore themes of courage, betrayal, and the struggle between\
good and evil, creating a deep and enduring appeal.";
char desc_fotr[] = \
"The Fellowship of the Ring, the first volume in the trilogy, tells of the fateful \
power of the One Ring. It begins a magnificent tale of adventure that will plunge \
the members of the Fellowship of the Ring into a perilous quest and set the stage \
for the ultimate clash between the powers of good and evil.";
char desc_twot[] = \
"The Fellowship has been forced to split up. Frodo and Sam must continue alone \
towards Mount Doom, where the One Ring must be destroyed. Meanwhile, at Helm’s Deep \
and Isengard, the first great battles of the War of the Ring take shape.";
char desc_rotk[] = \
"The Return of the King is the towering climax to J. R. R. Tolkien’s trilogy that \
tells the saga of the hobbits of Middle-earth and the great War of the Rings. In \
this concluding volume, Frodo and Sam make a terrible journey to the heart of the \
Land of the Shadow in a final reckoning with the power of Sauron. ";

// win
void chicken_dinner() {
    // I'm a nice guy
    system("/bin/sh");
}

void terminal_disgust() {
    int *a = 0;
    *a = 0x11;
}

void roast_user() {
    const char *roasts[] = {
        "Try reading. It's free.",
        "Buttons are hard, I get it.",
        "This isn't a creative writing contest.",
        "You're the reason 'Are you sure?' prompts exist.",
        "I hope this isn't your day job.",
        "404: /basic-competency.html not found.",
        "Try inputting your IQ next time.",
        "Please stop before someone sees this.",
        "Is this performance art?",
        "That's it. I'm done."
    };

    printf("\n%s\n\n", roasts[mistake_counter]);
    ++mistake_counter;
    sleep(3);

    if (mistake_counter >= (sizeof(roasts) / sizeof(roasts[0]))) {
        terminal_disgust();
    }
    return;
}

void clear_screen() {
    printf("\033[2J\033[H");
    return;
}

void clear_input() {
    int c;
    while ((c = getchar()) != '\n' && c != EOF);
    return;
}

void wait_enter(const char *msg) {
    int c;
    printf("%s", msg);
    getchar();
}

int colw_auth_name(int min) {
    int max = min;
    int len = 0;

    if (db.authors.forward == NULL) {
        return max;
    }

    author *fauth = BASE_ADDR(db.authors.forward, author, db_link);
    for (; fauth != NULL; fauth = link_nxauthor_db(&fauth->db_link)) {
        len = strlen(fauth->name);
        max = (max >= len ? max : len);
    }

    return max;
}

int colw_auth_pub(int min) {
    int max = min;
    int len = 0;

    if (db.authors.forward == NULL) {
        return max;
    }

    author *fauth = BASE_ADDR(db.authors.forward, author, db_link);
    for (; fauth != NULL; fauth = link_nxauthor_db(&fauth->db_link)) {
        len = strlen(fauth->publisher);
        max = (max >= len ? max : len);
    }

    return max;
}

int colw_book_name(int min) {
    int max = min;
    int len = 0;

    if (db.books.forward == NULL) {
        return max;
    }

    book *fbook = BASE_ADDR(db.books.forward, book, db_link);
    for (; fbook != NULL; fbook = link_nxbook_db(&fbook->db_link)) {
        len = strlen(fbook->name);
        max = (max >= len ? max : len);
    }

    return max;
}

double author_calc_rating(author *auth) {
    int sum;
    int cnt;

    if (auth->reviews.forward == (link_t *)NULL) {
        return 0;
    }

    sum = cnt = 0;
    review *rev = BASE_ADDR(auth->reviews.forward, review, au_link);
    for (; rev != NULL; rev = link_nxreview_au(&rev->au_link)) {
        sum += rev->rating;
        cnt += 1;
    }

    return (double)sum / cnt;
}

func_t *menu_init() {
    func_t *funcs = calloc(M_OPTION_CNT, sizeof(func_t));
    if (funcs == (func_t *)NULL) {
        printf("[ERROR] system out of resources");
        exit(137);
    }

    funcs[M_PRINT_AUTHORS] = menu_print_authors;
    funcs[M_NEW_AUTHOR] = menu_create_author;
    funcs[M_DELETE_AUTHOR] = menu_delete_author;
    funcs[M_PRINT_BOOKS] = menu_print_books;
    funcs[M_NEW_BOOK] = menu_create_book;
    funcs[M_DELETE_BOOK] = menu_delete_book;
    funcs[M_NEW_REVIEW] = menu_create_review;
    funcs[M_EXIT] = menu_exit;
    funcs[M_SHOW_HEAP] = menu_show_heap;

    return funcs;
}

void print_menu()
{
    clear_screen();
    printf("\nManage your bookshelf:\n");
    printf(" 1) Print all authors\n");
    printf(" 2) Print all books\n");
    printf(" 3) Register a new author\n");
    printf(" 4) Register a new book\n");
    printf(" 5) Add a book review\n");
    printf(" 6) Remove an author\n");
    printf(" 7) Remove a book\n");
    printf(" 8) Exit\n");
    printf(" 9) Show heap layout\n");
    return;
}

int get_value(const char *prompt, char *out, size_t max) {
    char ch;
    ssize_t ret;

    assert(out != NULL);
    printf("%s", prompt);
    fflush(stdout);

    size_t len = 0;
    for (len = 0; len < max; ++len) {
        ret = read(STDIN_FILENO, &ch, 1);
        if (ret <= 0) {
            break;
        } else if (ch == '\n') {
            break;
        }

        out[len] = ch;
    }

    out[len] = '\0';
    if (len + 1 >= max) {
        clear_input();
    }
    return len + 1;
}

int get_option(const char *prompt) {
    int val;
    printf("%s", prompt);
    scanf("%d", &val);
    clear_input();
    return val;
}

void menu_print_books() {
    int name_colw;
    int auth_colw;

    name_colw = colw_book_name(6) + 2;
    auth_colw = colw_auth_name(8) + 2;

    printf("\n%-*s %-*s %s\n", name_colw, "NAME", auth_colw, "AUTHOR", "DESCRIPTION");
    if (db.books.forward == NULL) {
        wait_enter("\n\nPress enter to continue...\n");
        return;
    }

    book *fbook = BASE_ADDR(db.books.forward, book, db_link);
    for (; fbook != NULL; fbook = link_nxbook_db(&fbook->db_link)) {
        printf(
            "%-*s %-*s %s\n",
            name_colw, fbook->name,
            auth_colw, fbook->author->name,
            fbook->description
            );
    }

    wait_enter("\nPress enter to continue...\n");
    return;
}

void menu_print_authors() {
    int name_colw;
    int publ_colw;

    double average_rating;

    name_colw = colw_auth_name(6) + 2;
    publ_colw = colw_auth_pub(11) + 2;

    printf(
        "\n%-*s %-*s %-8s %s\n",
        name_colw, "NAME",
        publ_colw, "PUBLISHER",
        "RATING", "DESCRIPTION");
    if (db.authors.forward == NULL) {
        wait_enter("\n\nPress enter to continue...\n");
        return;
    }

    author *fauth = BASE_ADDR(db.authors.forward, author, db_link);
    for (; fauth != NULL; fauth = link_nxauthor_db(&fauth->db_link)) {
        average_rating = author_calc_rating(fauth);
        printf(
            "%-*s %-*s %-8.1f %s\n",
            name_colw, fauth->name,
            publ_colw, fauth->publisher,
            average_rating,
            fauth->description
            );
    }

    wait_enter("\nPress enter to continue...\n");
    return;
}

void menu_create_book() {
    char name_buf[MAX_NAME];
    char desc_buf[MAX_DESC];
    char auth_buf[MAX_NAME];
    CREATE_CODE status;

    memset(name_buf, 0x00, MAX_NAME);
    memset(desc_buf, 0x00, MAX_DESC);
    memset(auth_buf, 0x00, MAX_NAME);

    clear_screen();
    printf("Create a new book:\n");

    printf(" %-14s", "Name");
    int name_s = get_value(" > ", name_buf, MAX_NAME);
    printf(" %-14s", "Author");
    int auth_s_s = get_value(" > ", auth_buf, MAX_NAME);
    printf(" %-14s", "Description");
    int desc_s = get_value(" > ", desc_buf, MAX_DESC);
    printf("[DEBUG] name_s = %d (len was %zu)\n", name_s, strlen(name_buf));
    printf("[DEBUG] desc_s = %d (len was %zu)\n", desc_s, strlen(desc_buf));
    fflush(stdout);
    switch (create_book(auth_buf, name_buf, name_s, desc_buf, desc_s)) {
        case CRT_NO_RESOURCES:
            printf("\n[ERROR] book creation failed : no resources\n");
            exit(137);
        case CRT_INVALID_PARAM:
            printf("\n[INVALID] could not find author with name '%s'\n", auth_buf);
            break;
        case CRT_SUCCESS:
            printf("\n[SUCCESS]\n");
            break;
        default:
            printf("\n[WEIRD] unexpected status code\n");
    }

    wait_enter("\nPress enter to continue...\n");
    clear_screen();
    return;
}

void menu_create_author() {
    char name_buf[MAX_NAME];
    char publ_buf[MAX_NAME];
    char desc_buf[MAX_DESC];

    CREATE_CODE status;

    memset(name_buf, 0x00, MAX_NAME);
    memset(publ_buf, 0x00, MAX_NAME);
    memset(desc_buf, 0x00, MAX_DESC);

    clear_screen();
    printf("Create a new author:\n");

    printf(" %-14s", "Name");
    int name_s = get_value(" > ", name_buf, MAX_NAME);
    printf(" %-14s", "Publisher");
    int publ_s = get_value(" > ", publ_buf, MAX_NAME);
    printf(" %-14s", "Description");
    int desc_s = get_value(" > ", desc_buf, MAX_DESC);
    printf("name_s(%d), publ_s (%d), desc_s(%d)\n", name_s, publ_s, desc_s);
    switch(create_author(name_buf, name_s, publ_buf, publ_s, desc_buf, desc_s)) {
        case CRT_NO_RESOURCES:
            printf("\n[ERROR] author creation failed : no resources\n" );
            exit(137);
        case CRT_INVALID_PARAM:
            printf("\n[INVALID] could not create author\n");
            break;
        case CRT_SUCCESS:
            printf("\n[SUCCESS]\n");
            break;
        default:
            printf("\n[WEIRD] unexpected status code\n");
    }

    wait_enter("\nPress enter to continue...\n");
    clear_screen();
    return;
}

void menu_create_review() {
    char name_buf[MAX_NAME];
    int  rating;

    memset(name_buf, 0x00, MAX_NAME);

    clear_screen();
    printf("Leave a book review:");

    printf(" %-14s", "Book Name");
    int name_s = get_value(" > ", name_buf, MAX_NAME);
    clear_input();
    printf(" %-14s", "Rating (0-5)");
    rating = get_option(" > ");

    switch(create_review(name_buf, rating)) {
        case EDT_NO_RESOURCES:
            printf("\n[ERROR] review creation failed : no resources\n");
            exit(137);
        case EDT_INVALID_PARAM:
            printf("\n[INVALID] could not find book with name '%s'\n", name_buf);
            break;
        case EDT_SUCCESS:
            printf("\n[SUCCESS]\n");
            break;
        default:
            printf("\n[WEIRD] unexpected status code\n");
    }

    wait_enter("\nPress enter to continue...\n");
    clear_screen();
    return;
}

void menu_delete_author() {
    char name_buf[MAX_NAME];
    DELETE_CODE status;

    memset(name_buf, 0x00, MAX_NAME);

    clear_screen();
    printf("Delete an author:\n");

    printf(" %14s", "Name");
    int name_s = get_value(" > ", name_buf, MAX_NAME);

    switch(delete_author(name_buf)) {
        case DEL_INVALID_PARAM:
            printf("\n[INVALID] could not find author with name '%s'\n", name_buf);
            break;
        case DEL_SUCCESS:
            printf("\n[SUCCESS]\n");
            break;
        default:
            printf("\n[WEIRD] unexpected status code\n");
    }

    wait_enter("\nPress enter to continue...\n");
    clear_screen();
    return;
}

void menu_delete_book() {
    char name_buf[MAX_NAME];
    DELETE_CODE status;

    memset(name_buf, 0x00, MAX_NAME);

    clear_screen();
    printf("Delete a book:\n");

    printf(" %14s", "Name");
    int name_s = get_value(" > ", name_buf, MAX_NAME);
    switch(delete_book(name_buf)) {
        case DEL_INVALID_PARAM:
            printf("\n[INVALID] could not find book with name '%s'\n", name_buf);
            break;
        case DEL_SUCCESS:
            printf("\n[SUCCESS]\n");
            break;
        default:
            printf("\n[WEIRD] unexpected status code\n");
    }
    wait_enter("\nPress enter to continue...\n");
    clear_screen();
    return;
}

void menu_exit() {
    exit(0);
}

void menu_show_heap() {
    clear_screen();
    printf("\n");
    printf("================================================================\n");
    printf("                    HEAP VISUALIZATION                          \n");
    printf("================================================================\n");
    printf("[ACTIVE STRUCTURES]\n");
    printf("  %-20s %-18s %s\n", "Type", "Address", "Size");
    printf("  %-20s %-18s %s\n", "----", "-------", "----");

    if (db.authors.forward != NULL) {
        author *auth = BASE_ADDR(db.authors.forward, author, db_link);
        for (; auth != NULL; auth = link_nxauthor_db(&auth->db_link)) {
            printf("  %-20s %p %zu bytes\n", "Author struct", auth, sizeof(author));
            if (auth->name)
                printf("    ├─ %-16s %p %zu bytes\n", "name", auth->name, strlen(auth->name) + 1);
            if (auth->publisher)
                printf("    ├─ %-16s %p %zu bytes\n", "publisher", auth->publisher, strlen(auth->publisher) + 1);
            if (auth->description)
                printf("    └─ %-16s %p %zu bytes\n", "description", auth->description, strlen(auth->description) + 1);
        }
    }

    if (db.books.forward != NULL) {
        book *bk = BASE_ADDR(db.books.forward, book, db_link);
        for (; bk != NULL; bk = link_nxbook_db(&bk->db_link)) {
            printf("  %-20s %p %zu bytes\n", "Book struct", bk, sizeof(book));
            printf("    ├─ author ref:   %p\n", bk->author);
                        
            if (bk->name)
                printf("    ├─ %-16s %p %zu bytes\n", "name", bk->name, strlen(bk->name) + 1);
            if (bk->description)
                printf("    └─ %-16s %p %zu bytes\n", "description", bk->description, strlen(bk->description) + 1);
        }
    }

    if (db.authors.forward != NULL) {
        author *auth = BASE_ADDR(db.authors.forward, author, db_link);
        for (; auth != NULL; auth = link_nxauthor_db(&auth->db_link)) {
            if (auth->reviews.forward != NULL) {
                review *rev = BASE_ADDR(auth->reviews.forward, review, au_link);
                for (; rev != NULL; rev = link_nxreview_au(&rev->au_link)) {
                    printf("  %-20s %p %zu bytes\n", "Review struct", rev, sizeof(review));
                    printf("    ├─ book ref:     %p\n", rev->book);
                    printf("    ├─ author ref:   %p\n", rev->author);                    
                    printf("    └─ rating:       %d\n", rev->rating);
                }
            }
        }
    }  
    printf("================================================================\n");
    wait_enter("Press enter to continue...\n");
}

void bookshelf_init() {
    // Every bookshelf needs the classics
    create_author("J.R. Tolkien", strlen("J.R. Tolkien") + 1, "George Allen & Unwin", strlen("George Allen & Unwin") + 1, desc_tolk, sizeof(desc_tolk));
    create_book("J.R. Tolkien", "The Fellowship of the Ring", strlen("The Fellowship of the Ring") + 1, desc_fotr, sizeof(desc_fotr));
    create_book("J.R. Tolkien", "The Two Towers", strlen("The Two Towers") + 1, desc_twot, sizeof(desc_twot));
    create_book("J.R. Tolkien", "The Return of the King", strlen("The Return of the King") + 1, desc_rotk, sizeof(desc_rotk));
    create_review("The Fellowship of the Ring", 5);
    create_review("The Two Towers", 5);
    create_review("The Return of the King", 5);
    return;
}

int main() {
    int     option;
    func_t  *funcs;

    bookshelf_init();
    funcs = menu_init();

    while (CHAOS_RULES) {
        print_menu();
        option = get_option("\n > ");

        if (option > M_OPTION_CNT || option <= 0) {
            roast_user();
            continue;
        }

        funcs[option - 1]();
    }
}
