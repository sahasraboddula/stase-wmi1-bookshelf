#include <stdlib.h>
#include <string.h>
#include <stdio.h>
#include <stddef.h>
#include <assert.h>

typedef struct link_t   link_t;
typedef struct author   author;
typedef struct book     book;

typedef enum {
    CRT_SUCCESS,
    CRT_NO_RESOURCES,
    CRT_INVALID_PARAM
} CREATE_CODE;

typedef enum {
    DEL_SUCCESS,
    DEL_INVALID_PARAM
} DELETE_CODE;

typedef enum {
    EDT_SUCCESS,
    EDT_INVALID_PARAM,
    EDT_NO_RESOURCES,
    EDT_BAD_POINTER
} EDIT_CODE;

typedef struct link_t {
    link_t    *backward;
    link_t    *forward;
} link_t;

typedef struct review {
    book    *book;
    author  *author;
    link_t  au_link;
    int     rating;
} review;

typedef struct author {
    char    *publisher;
    char    *description;
    char    *name;
    link_t   db_link;
    link_t   reviews;
    link_t   books;
} author;

typedef struct book {
    char      *name;
    char      *description;
    link_t     db_link;
    link_t     au_link;
    author    *author;
} book;

typedef struct database {
    link_t        authors;
    link_t        books;
} database;

#define BASE_ADDR(ptr, struct_typ, struct_att) \
    ((struct_typ *)((char *)(ptr) - offsetof(struct_typ, struct_att)))

#define MAX_NAME    128
#define MAX_DESC    1024

CREATE_CODE    create_author(
    char *name, int name_n,
    char *publisher, int publ_n,
    char *description, int desc_n
    );

CREATE_CODE    create_book(
    char *au_name,
    char *bk_name, int name_n,
    char *description, int desc_n
    );

DELETE_CODE    delete_author(char *name);
DELETE_CODE    delete_book(char *name);

EDIT_CODE      create_review(char *bname, int rating);

book    *link_nxbook_au(link_t *bk_link);
book    *link_nxbook_db(link_t *bk_link);
author  *link_nxauthor_db(link_t *au_link);
review  *link_nxreview_au(link_t *au_link);

extern database db;
