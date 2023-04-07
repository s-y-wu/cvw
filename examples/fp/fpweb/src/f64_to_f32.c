// f64_to_f32.c
// sywu@hmc.edu 5 April 2023

#include "fpcalc_util.h"

int opSize = 0;

// example usage:
// ./f64_to_f32 xxxxxxxxxxxxxxxx [RNE/RZ/RM/RP]
int main(int argc, char *argv[]) {
  softfloatInit();

  if (argc == 3) softfloat_roundingMode = parseRound(argv[2]);

  uint64_t input_binary = parseNum(argv[1]);
  float64_t input_float;
  input_float.v = input_binary;

  float32_t output_float = f64_to_f32(input_float);

  printf("Input:  ");
  printF64(input_float);
  printf("Output: ");
  printF32(output_float);
  printFlags();
}
    