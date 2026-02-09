#!/usr/bin/env bash
set -euxo pipefail

: "${KLEE_INC:=/home/shafi/tools/klee/include}"

echo "[INFO] pwd=$(pwd)"
echo "[INFO] KLEE_INC=$KLEE_INC"

test -f driver_uaf_demo.c
test -f stubs_demo.c
test -f ../bookshelf.c
test -f ../bookshelf.h

KLEE_ARGS=()
if [ -f "$KLEE_INC/klee/klee.h" ]; then
  KLEE_ARGS=(-I"$KLEE_INC" -D__KLEE__)
else
  echo "[WARN] klee.h not found at $KLEE_INC/klee/klee.h; building without __KLEE__"
fi

# Harness + stubs
clang "${KLEE_ARGS[@]}" -I.. -O0 -g -emit-llvm -c driver_uaf_demo.c -o driver_uaf_demo.bc
clang "${KLEE_ARGS[@]}" -I.. -O0 -g -emit-llvm -c stubs_demo.c       -o stubs_demo.bc

# Program as library (exclude its main)
clang "${KLEE_ARGS[@]}" -DKLEE_DRIVER_BUILD -I.. -O0 -g -emit-llvm -c ../bookshelf.c -o bookshelf.bc

EXTRA_BC=()
if [ -f ../globals.c ]; then
  clang "${KLEE_ARGS[@]}" -DKLEE_DRIVER_BUILD -I.. -O0 -g -emit-llvm -c ../globals.c -o globals.bc
  EXTRA_BC+=(globals.bc)
fi

llvm-link-14 driver_uaf_demo.bc stubs_demo.bc bookshelf.bc "${EXTRA_BC[@]}" -o uaf_demo.bc

ls -lah *.bc
echo "[OK] Built uaf_demo.bc"
