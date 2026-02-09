#!/usr/bin/env bash
set -euo pipefail

HERE="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJ="$(cd "$HERE/.." && pwd)"

# ------------------------------------------------------------
# 4) Write stubs_demo.c (ensure no external strlen/strcmp/etc.)
# ------------------------------------------------------------
echo "[stub.sh] Writing demo_klee/stubs_demo.c (libc + io stubs)"

cat > "$HERE/stubs_demo.c" <<'EOF'
#include <stdarg.h>
#include <stdlib.h>
#include <stdint.h>
#include <stddef.h>
#include <string.h>

#ifdef __KLEE__
  #include "klee/klee.h"
#endif

// printing: no-op
int printf(const char *fmt, ...) { (void)fmt; return 0; }
int puts(const char *s) { (void)s; return 0; }
int putchar(int c) { (void)c; return c; }

// provide stdin symbol
void *stdin;

// input: keep menu dead
int getchar(void) { return -1; }
char *fgets(char *s, int size, void *stream) { (void)s; (void)size; (void)stream; return NULL; }
int __isoc99_scanf(const char *fmt, ...) { (void)fmt; return 0; }

// ---- string helpers (SELF-CONTAINED; no external strlen) ----
size_t strlen(const char *s) {
  if (!s) return 0;
  size_t n = 0;
  while (s[n]) n++;
  return n;
}

size_t strnlen(const char *s, size_t maxlen) {
  if (!s) return 0;
  size_t i = 0;
  for (; i < maxlen && s[i]; i++) {}
  return i;
}

size_t strcspn(const char *s, const char *reject) {
  if (!s || !reject) return 0;
  for (size_t i = 0; s[i]; i++) {
    for (size_t j = 0; reject[j]; j++) {
      if (s[i] == reject[j]) return i;
    }
  }
  return strlen(s);
}

int strcmp(const char *a, const char *b) {
  if (a == b) return 0;
  if (!a) return -1;
  if (!b) return 1;
  while (*a && (*a == *b)) { a++; b++; }
  return (unsigned char)*a - (unsigned char)*b;
}

char *strncpy(char *dst, const char *src, size_t n) {
  if (!dst || !src) return dst;
  size_t i = 0;
  for (; i < n && src[i]; i++) dst[i] = src[i];
  for (; i < n; i++) dst[i] = 0;
  return dst;
}

char *strdup(const char *s) {
  if (!s) return NULL;
  size_t n = strlen(s) + 1;
  char *p = (char *)malloc(n);
  if (!p) return NULL;
  for (size_t i = 0; i < n; i++) p[i] = s[i];
  return p;
}

long strtol(const char *nptr, char **endptr, int base) {
  (void)base;
  if (!nptr) { if (endptr) *endptr = (char*)nptr; return 0; }
  long v = 0;
  const char *p = nptr;
  while (*p >= '0' && *p <= '9') { v = v * 10 + (*p - '0'); p++; }
  if (endptr) *endptr = (char*)p;
  return v;
}

// math
double sin(double x) { (void)x; return 0.0; }
double cos(double x) { (void)x; return 0.0; }
long long llround(double x) { (void)x; return 0; }

// project symbol referenced somewhere
void print_card(void) {}

// exit
void exit(int code) {
  (void)code;
#ifdef __KLEE__
  klee_silent_exit(0);
#else
  abort();
#endif
}
EOF
