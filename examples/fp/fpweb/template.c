// conversion_template.c
// sywu@hmc.edu 4 April 2023
// 
// Template for Softloat conversion calculator

#include <stdio.h>
#include <stdint.h>
#include <stdlib.h>
#include <string.h>
#include "softfloat.h"
#include "softfloat_types.h"

// Unions: used to convert between floating point types and binary representations

// Half Precision
typedef union hp {
  uint16_t v;       // 16-bit binary representation
  float16_t h;      // 16-bit floating point number
} hp;

// Single Precision
typedef union sp {
  uint32_t v;       // 32-bit binary representation
  float32_t ft;     // 32-bit floating point number
  float f;          // float type  
} sp;

// Double Precision
typedef union dp {
  uint64_t v;       // 64-bit binary representation
  double d;         // double type
} dp;


// uint64_t parseNum(char *num) {
//   uint64_t result;
//   int size; // size of operands in bytes (2= half, 4=single, 8 = double)
//   if (strlen(num) < 8) size = 2;
//   else if (strlen(num) < 16) size = 4;
//   else if (strlen(num) < 19) size = 8;
//   else {
//     printf("Error: only half, single, and double precision supported");
//     exit(1);
//   }

//   if (opSize != 0) {
//     if (size != opSize) {
//       printf("Error: inconsistent operand sizes %d and %d\n", size, opSize);
//       exit(1);
//     } 
//   } else {
//     opSize = size;
//     //printf ("Operand size is %d\n", opSize);
//   }
//   result = (uint64_t)strtoul(num, NULL, 16);
//   //printf("Parsed %s as 0x%lx\n", num, result);
//   return result;
// }




int main(int argc, char *argv[]) {
    hp init_hp;
    sp fin_sp;

    printf("Hello World\n");
    printf("Number %d\n", 16);
}