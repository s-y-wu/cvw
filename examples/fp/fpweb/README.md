# Welcome!

* Sean and Kaanthi are currently extending fpcalc.
* Contact: sywu@hmc.edu


## SoftFloat Notes

### How fpcalc imports stuff
* In fpcalc.c, SoftFloat imports as followed from here `bin/wally-tool-chain-install.sh`
    * Imports are from root level `/opt/riscv/riscv-isa-sim`
    

### Conversions

List: https://github.com/ucb-bar/berkeley-softfloat-3/blob/master/source/include/softfloat.h

 
In Berkeley's Softfloat, the suffix "r_minMag" in function names indicates that the function is performing a conversion from a floating-point number to an integer type with rounding mode "round down-toward-zero" (denoted by the 'r' prefix) and with the minimum magnitude value possible for the floating-point type (denoted by the "minMag" suffix).

In the specific case of 'f64_to_ui64_r_minMag.c', the function converts a 64-bit double-precision floating-point number to a 64-bit unsigned integer with the rounding mode set to round down-toward-zero and with the minimum magnitude value for the floating-point type.

## C Notes

### Printf 

In printf, the flag %d is used to format and print an integer in decimal format, while the flag %s is used to format and print a string.

There are many other similar flags in printf that are used to format and print different types of data. Here are some of the commonly used flags:

%f: formats and prints a floating-point number in decimal notation
%e or %E: formats and prints a floating-point number in scientific notation
%x or %X: formats and prints an integer in hexadecimal format (lowercase or uppercase)
%o: formats and prints an integer in octal format
%c: formats and prints a single character
%p: formats and prints a pointer value
%u: formats and prints an unsigned integer in decimal format
Each flag can also take additional modifiers to further specify the format, such as specifying the number of decimal places to display for floating-point numbers. The exact behavior of each flag and modifier is specified in the printf documentation.