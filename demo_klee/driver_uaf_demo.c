#include <klee/klee.h>
#include <string.h>
#include <assert.h>

#include "../bookshelf.h"   

int main() {
    link_init(&db.authors);
    link_init(&db.books);
    char au_name[MAX_NAME];
    char bk_name[MAX_NAME];
    char au_publ[MAX_NAME];
    char au_desc[MAX_DESC];
    char bk_desc[MAX_DESC];

    klee_make_symbolic(au_name, sizeof(au_name), "au_name");
    klee_make_symbolic(bk_name, sizeof(bk_name), "bk_name");
    klee_make_symbolic(au_publ, sizeof(au_publ), "au_publ");
    klee_make_symbolic(au_desc, sizeof(au_desc), "au_desc");
    klee_make_symbolic(bk_desc, sizeof(bk_desc), "bk_desc");
    au_name[MAX_NAME - 1] = '\0';
    bk_name[MAX_NAME - 1] = '\0';
    au_publ[MAX_NAME - 1] = '\0';
    au_desc[MAX_DESC - 1] = '\0';
    bk_desc[MAX_DESC - 1] = '\0';

    create_author(au_name, sizeof(au_name), au_publ, sizeof(au_publ), au_desc, sizeof(au_desc));
    create_book(au_name, bk_name, sizeof(bk_name), bk_desc, sizeof(bk_desc));

    book *bk = NULL;
    if (db.books.forward != NULL) {
        bk = BASE_ADDR(db.books.forward, book, db_link);
    }

    author *auth_ptr = NULL;
    if (bk != NULL) {
        auth_ptr = bk->author;
    }    

    delete_author(au_name);
    
    // Now access the freed author
    if (bk) {
        klee_check_memory_access(bk, sizeof(author));
    }
    
    return 0;
}