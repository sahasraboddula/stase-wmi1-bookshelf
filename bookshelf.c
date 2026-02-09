#include "bookshelf.h"

database    db;

void *alloc_struct(size_t size) {
    void *ptr = malloc(size);
    if (!ptr) 
        return NULL;
    memset(ptr, 0, size);
    return ptr;
}

void link_init(link_t *newl) {
    newl->backward = NULL;
    newl->forward = NULL;
}

void link_prepend(link_t *list, link_t *newl) {
    newl->backward = list;
    if (list->forward == NULL) {
        newl->forward = NULL;
    } else {
        newl->forward = list->forward;
        (newl->forward)->backward = newl;
    }

    list->forward = newl;
    return;
}

void link_unlink(link_t *dell) {
    assert(dell->backward != (link_t *)NULL);
    (dell->backward)->forward = dell->forward;
    if (dell->forward != (link_t *)NULL) {
        (dell->forward)->backward = dell->backward;
    }

    dell->backward = (link_t *)NULL;
    dell->forward = (link_t *)NULL;
}

book *link_nxbook_db(link_t *bk_link) {
    if (bk_link == NULL || bk_link->forward == NULL) {
        return NULL;
    }

    return BASE_ADDR(bk_link->forward, book, db_link);
}

book *link_nxbook_au(link_t *bk_link) {
    if (bk_link == NULL || bk_link->forward == NULL) {
        return NULL;
    }

    return BASE_ADDR(bk_link->forward, book, au_link);
}

author *link_nxauthor_db(link_t *au_link) {
    if (au_link == NULL || au_link->forward == NULL) {
        return NULL;
    }

    return BASE_ADDR(au_link->forward, author, db_link);
}

review *link_nxreview_au(link_t *au_link) {
    if (au_link == NULL || au_link->forward == NULL) {
        return NULL;
    }

    return BASE_ADDR(au_link->forward, review, au_link);
}

author *find_author(char *name) {
    if (db.authors.forward == (link_t *)NULL) return NULL;
    for (author *fauth = BASE_ADDR(db.authors.forward, author, db_link);
         fauth != NULL; fauth = link_nxauthor_db(&fauth->db_link)) {
        if (strcmp(fauth->name, name) == 0) return fauth;
    }
    return NULL;
}

book *find_book(char *name) {
    if (db.books.forward == (link_t *)NULL) return NULL;
    for (book *fbook = BASE_ADDR(db.books.forward, book, db_link);
         fbook != NULL; fbook = link_nxbook_db(&fbook->db_link)) {
        if (strcmp(fbook->name, name) == 0) return fbook;
    }
    return NULL;
}

void free_author(author *auth) {
    if (auth->name != NULL) {
        free(auth->name);
    }

    if (auth->publisher != NULL) {
        free(auth->publisher);
    }

    if (auth->description != NULL) {
        free(auth->description);
    }

    free(auth);
}

void free_book(book *bk) {
    if (bk->name != NULL) {
        free(bk->name);
    }

    if (bk->description != NULL) {
        free(bk->description);
    }

    free(bk);
}

void free_book_reviews(book *bk) {
    review *tmp;

    author *auth = bk->author;
    if (auth->reviews.forward == (link_t *)NULL) {
        return;
    }

    review *rev = BASE_ADDR(auth->reviews.forward, review, au_link);
    while (rev != NULL) {
        tmp = rev;
        rev = link_nxreview_au(&tmp->au_link);
        if (tmp->book == bk) {
            link_unlink(&tmp->au_link);
            free(tmp);
        }
    }

    return;
}

CREATE_CODE create_author (char *name, int name_n, char *publisher,
                int publ_n, char *description, int desc_n) {
    author *new_author = alloc_struct(sizeof(author));
    if (new_author == (author *)NULL) {
        return CRT_NO_RESOURCES;
    }

    link_init(&new_author->db_link);
    link_init(&new_author->reviews);
    link_init(&new_author->books);

    new_author->name = malloc(name_n);
    if (new_author->name == (char *)NULL) {
        free_author(new_author);
        return CRT_NO_RESOURCES;
    }
    memcpy(new_author->name, name, name_n);
    new_author->name[name_n - 1] = '\0';

    new_author->publisher = malloc(publ_n);
    if (new_author->publisher == (char *)NULL) {
        free_author(new_author);
        return CRT_NO_RESOURCES;
    }
    memcpy(new_author->publisher, publisher, publ_n);
    new_author->publisher[publ_n - 1] = '\0';

    new_author->description = malloc(desc_n);
    if (new_author->description == (char *)NULL) {
        free_author(new_author);
        return CRT_NO_RESOURCES;
    }
    memcpy(new_author->description, description, desc_n);
    new_author->description[desc_n - 1] = '\0';

    link_prepend(&db.authors, &new_author->db_link);
    return CRT_SUCCESS;
}

CREATE_CODE create_book (char *au_name, char *bk_name, int name_n,
                char *description, int desc_n) {
    char    *author_name;

    book *new_book = alloc_struct(sizeof(book));
    if (new_book == (book *)NULL) {
        return CRT_NO_RESOURCES;
    }

    new_book->author = find_author(au_name);
    if (new_book->author == (author *)NULL) {
        free_book(new_book);
        return CRT_INVALID_PARAM;
    }

    new_book->name = malloc(name_n);
    if (new_book->name == (char *)NULL) {
        free_book(new_book);
        return CRT_NO_RESOURCES;
    }
    memcpy(new_book->name, bk_name, name_n);
    new_book->name[name_n - 1] = '\0';

    new_book->description = malloc(desc_n);
    if (new_book->description == (char *)NULL) {
        free_book(new_book);
        return CRT_NO_RESOURCES;
    }
    memcpy(new_book->description, description, desc_n);
    new_book->description[desc_n - 1] = '\0';

    link_prepend(&db.books, &new_book->db_link);
    link_prepend(&(new_book->author)->books, &new_book->au_link);
    return CRT_SUCCESS;
}

EDIT_CODE create_review(char *bname, int rating) {
    if (rating < 0 || rating > 5)
        return EDT_INVALID_PARAM;

    book *rbook = find_book(bname);
    if (rbook == (book *)NULL) {
        return EDT_INVALID_PARAM;
    }

    author *auth = rbook->author;
    assert(auth != (author *)NULL);

    review *rev = alloc_struct(sizeof(review));
    if (rev == (review *)NULL) {
        return EDT_NO_RESOURCES;
    }

    rev->rating = rating;
    rev->book = rbook;
    rev->author = auth;

    link_prepend(&auth->reviews, &rev->au_link);
    return EDT_SUCCESS;
}

DELETE_CODE delete_author(char *name) {
    author *del_author = find_author(name);
    if (del_author == (author *)NULL) {
        return DEL_INVALID_PARAM;
    }

    link_unlink(&del_author->db_link);
    free_author(del_author);
    return DEL_SUCCESS;
}

DELETE_CODE delete_book(char *name) {
    review *rev;

    book *del_book = find_book(name);
    if (del_book == (book *)NULL) {
        return DEL_INVALID_PARAM;
    }

    free_book_reviews(del_book);
    link_unlink(&del_book->db_link);
    link_unlink(&del_book->au_link);
    free_book(del_book);
    return DEL_SUCCESS;
}
