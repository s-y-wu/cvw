from functions import SoftFloatFunctions as funcs
import itertools
from datetime import datetime


class CodeGen():
    author= "sywu@hmc.edu"
    date = datetime.today().strftime("%-d %B %Y")

    def __init__(self):
        pass
    
    def write(self, filename, input_string):
        with open(f"src/{filename}", "w") as file:
            file.write(input_string)

    def write_conversion_code(self):
        bits = [16, 32, 64]
        for input_bitcount, output_bitcount in itertools.permutations(bits, 2):
            softfloat_func = f"f{input_bitcount}_to_f{output_bitcount}"
            filestring = self.one_input_file(softfloat_func, input_bitcount, output_bitcount)
            self.write(softfloat_func, filestring)

    def one_input_file(self, softfloat_func, in_bitcount, out_bitcount):
        """
        Maximum 3 inputs except
        ('f128M_roundToInt', ['const float128_t *', 'uint_fast8_t', 'bool', 'float128_t *'])
        """
        return f"""\
// {softfloat_func}.c
// {CodeGen.author} {CodeGen.date}

#include "fpcalc_util.h"

int opSize = 0;

// Example usage:
// ./{softfloat_func} {int(0.25 * in_bitcount) * 'x'} [RNE/RZ/RM/RP]
int main(int argc, char *argv[]) {{
  softfloatInit();

  if (argc == 3) softfloat_roundingMode = parseRound(argv[2]);

  uint{in_bitcount}_t input_binary = parseNum(argv[1]);
  float{in_bitcount}_t input_float;
  input_float.v = input_binary;

  float{out_bitcount}_t output_float = {softfloat_func}(input_float);

  printf("Input:  ");
  printF{in_bitcount}(input_float);
  printf("Output: ");
  printF{out_bitcount}(output_float);
  printFlags();
}}
    """

if __name__=='__main__':
    generator = CodeGen()
    generator.write_conversion_code()