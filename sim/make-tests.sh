#!/bin/bash

rm -r work*
make allclean
make
# cd ../../tests/imperas-riscv-tests/
# make allclean
# make
# cd ../wally-riscv-arch-test
# make allclean
# make
# make XLEN=32
# exe2memfile.pl work/*/*/*.elf
# cd ../linux-testgen/linux-testvectors
# ./tvLinker.sh
# cd ../../../regression
