# Makefile

CC     = emcc
CFLAGS = -O3 -Wno-format-overflow
LIBS   = -lm
LFLAGS = -L. 
# IFLAGS   = -I$(RISCV)/riscv-isa-sim/softfloat
# LIBS   = $(RISCV)/riscv-isa-sim/build/libsoftfloat.a
# Return to IEEE Behavior
IFLAGS = -I../../../addins/SoftFloat-3e/source/include/
LIBS   = ../../../addins/SoftFloat-3e/build/Linux-x86_64-GCC/softfloat.a
SRCS   = $(wildcard *.c)

PROGS = $(patsubst %.c,%,$(SRCS))

all:	$(PROGS)

%: %.c
	$(CC) $(CFLAGS) $(IFLAGS) $(LFLAGS) -o hello.html $< $(LIBS) -s WASM=1 -s SIDE_MODULE=1 -fPIC --shell-file shell_minimal.html

clean: 
	rm -f $(PROGS)
