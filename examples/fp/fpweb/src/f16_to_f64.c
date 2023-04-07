// f16_to_f64.c
// sywu@hmc.edu 5 April 2023

#include "fpcalc_util.h"

int opSize = 0;

// example usage:
// ./f16_to_f64 xxxx [RNE/RZ/RM/RP]
int main(int argc, char *argv[]) {
  softfloatInit();

  if (argc == 3) softfloat_roundingMode = parseRound(argv[2]);

  uint16_t input_binary = parseNum(argv[1]);
  float16_t input_float;
  input_float.v = input_binary;

  float64_t output_float = f16_to_f64(input_float);

  printf("Input:  ");
  printF16(input_float);
  printf("Output: ");
  printF64(output_float);
  printFlags();
}
    