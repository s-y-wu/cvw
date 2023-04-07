#ifndef FPCALC_UTIL_H
#define FPCALC_UTIL_H

#include <stdio.h>
#include <stdint.h>
#include <stdlib.h>
#include <string.h>
#include "softfloat.h"
#include "softfloat_types.h"

typedef union hp {
  uint16_t v;
  float16_t h;
} hp;

typedef union sp {
  uint32_t v;
  float32_t ft;
  float f;
} sp;

typedef union dp {
  uint64_t v;
  double d;
} dp;

extern int opSize;

void long2binstr(unsigned long  val, char *str, int bits);
void printF16(float16_t f);
void printF32(float32_t f);
void printF64(float64_t f);
void printFlags(void);
void softfloatInit(void);
uint64_t parseNum(char *num);
char parseOp(char *op);
char parseRound(char *rnd);

#endif /* FPCALC_UTIL_H */


