#!/usr/bin/python3
##################################
# testgen.py
#
# David_Harris@hmc.edu 19 January 2021
#
# Generate directed and random test vectors for RISC-V Design Validation.
##################################

##################################
# libraries
##################################
from datetime import datetime
from random import randint 
from random import seed
from random import getrandbits

##################################
# functions
##################################

def twoscomp(a):
  amsb = a >> (XLEN-1)
  alsbs = ((1 << (XLEN-1)) - 1) & a
  if (amsb):
      asigned = a - (1<<XLEN)
  else:
      asigned = a
  #print("a: " + str(a) + " amsb: "+str(amsb)+ " alsbs: " + str(alsbs) + " asigned: "+str(asigned))
  return asigned

def computeExpected(a, b):
  asigned = twoscomp(a)
  bsigned = twoscomp(b)

  if (INSTRUCTION in ["ADD", "ADDI", "ADDIW"]):
    return a + b
  elif (INSTRUCTION in ["SUB"]):
    return a - b
  elif (INSTRUCTION == "SLT"):
    return asigned < bsigned
  elif (INSTRUCTION == "SLTU"):
    return a < b
  elif (INSTRUCTION == "XOR"):
    return a ^ b
  elif (INSTRUCTION == "OR"):
    return a | b
  elif (INSTRUCTION == "AND"):
    return a & b
  else:
    die("bad test name ", INSTRUCTION)
  #  exit(1)

def randRegs():
  reg1 = randint(1,31)
  reg2 = randint(1,31)
  reg3 = randint(1,31) 
  if (reg1 == 6 or reg2 == 6 or reg3 == 6 or reg1 == reg2):
    return randRegs()
  else:
      return reg1, reg2, reg3

def cleanExpectation(expected):
  expected = expected % 2**XLEN # drop carry if necessary
  if (expected < 0): # take twos complement
    expected = 2**XLEN + expected
  return expected

def writeVector(a, b):
  global TEST_COUNTER
  expected = computeExpected(a, b)
  expected = cleanExpectation(expected)
  reg1, reg2, reg3 = randRegs()
  if INSTRUCTION in IMM_INSTRUCTIONS:
    lines = writeITypeTestcase(a, b, expected, reg1, reg3)
  else:
    lines =  writeRTypeTestcase(a, b, expected, reg1, reg2, reg3)
  F.write(lines)
  TEST_COUNTER = TEST_COUNTER+1

def getWritingParams():
  if (XLEN == 32):
    storecmd = "sw"
    wordsize = 4
  else:
    storecmd = "sd"
    wordsize = 8
    formatstrlen = str(int(XLEN/4))
  formatstr = "0x{:0" + formatstrlen + "x}" # format as XLEN-bit hexadecimal number
  formatrefstr = "{:08x}" # format as XLEN-bit hexadecimal number with no leading 0x
  return storecmd, wordsize, formatstr
  
def writeRTypeTestcase(a, b, expected, reg1, reg2, reg3):
  storecmd, wordsize, formatstr = getWritingParams()
  lines = "\n# Testcase " + str(TEST_COUNTER) + ":  rs1:x" + str(reg1) + "(" + formatstr.format(a)
  lines = lines + "), rs2:x" + str(reg2) + "(" +formatstr.format(b) 
  lines = lines + "), result rd:x" + str(reg3) + "(" + formatstr.format(expected) +")\n"
  lines = lines + "li x" + str(reg1) + ", MASK_XLEN(" + formatstr.format(a) + ")\n"
  lines = lines + "li x" + str(reg2) + ", MASK_XLEN(" + formatstr.format(b) + ")\n"
  lines = lines + INSTRUCTION + " x" + str(reg3) + ", x" + str(reg1) + ", x" + str(reg2) + "\n"
  lines = lines + storecmd + " x" + str(reg3) + ", " + str(wordsize*TEST_COUNTER) + "(x6)\n"
  # lines = lines + "RVTEST_IO_ASSERT_GPR_EQ(x7, x" + str(reg3) +", "+formatstr.format(expected)+")\n"
  return lines

def writeITypeTestcase(a, imm, expected, reg1, reg3):
  # 12 bit two's complement
  imm = min(imm, 0b011111111111)
  imm = max(imm, 0)
  storecmd, wordsize, formatstr = getWritingParams()
  lines = "\n# Testcase " + str(TEST_COUNTER) + ":  rs1:x" + str(reg1) + "(" + formatstr.format(a)
  lines = lines + "), Imm(" + formatstr.format(imm) 
  lines = lines + "), result rd:x" + str(reg3) + "(" + formatstr.format(expected) +")\n"
  lines = lines + "li x" + str(reg1) + ", MASK_XLEN(" + formatstr.format(a) + ")\n"
  lines = lines + INSTRUCTION + " x" + str(reg3) + ", x" + str(reg1) + ", " + formatstr.format(imm) + "\n"
  lines = lines + storecmd + " x" + str(reg3) + ", " + str(wordsize*TEST_COUNTER) + "(x6)\n"
  return lines

def writeHeader():
    # print custom header part
    line = "///////////////////////////////////////////\n"
    F.write(line)
    nameline="// "+ FNAME + "\n// " + AUTHOR + "\n"
    F.write(nameline)
    line ="// Created " + str(datetime.now()) 
    F.write(line)

    # insert generic header
    h = open("testgen_header.S", "r")
    for line in h:  
      F.write(line)

def writeFooter():
    line = "\n.EQU NUMTESTS," + str(TEST_COUNTER) + "\n\n"
    F.write(line)
    h = open("testgen_footer.S", "r")
    for line in h:  
      F.write(line)
    nameline="// "+FNAME+ "\n// " + AUTHOR + "\n"
    F.write(nameline)
    # Finish
    #    lines = ".fill " + str(TEST_COUNTER) + ", " + str(wordsize) + ", -1\n"
    #    lines = lines + "\nRV_COMPLIANCE_DATA_END\n" 

def writeDirectedVectors():
  corners = []
  if INSTRUCTION in REG_INSTRUCTIONS:
      corners += [0, 1, 2, 0xFF, 0x624B3E976C52DD14 % 2**XLEN, 2**(XLEN-1)-2, 2**(XLEN-1)-1, 
                2**(XLEN-1), 2**(XLEN-1)+1, 0xC365DDEB9173AB42 % 2**XLEN, 2**(XLEN)-2, 2**(XLEN)-1]
  elif INSTRUCTION in IMM_INSTRUCTIONS:
      corners += [0, 1, 2, 0b011111111111, 0b100000000000, 0b111111111111]

  for a in corners:
      for b in corners:
        writeVector(a, b)

def writeRandomVectors():
  for _ in range(0, NUMRAND):
      a = getrandbits(XLEN)
      b = getrandbits(XLEN)
      writeVector(a, b)

def getFileName():
  instructiontype = "I"
  pathname = "../wally-riscv-arch-test/riscv-test-suite/rv"
  pathname += str(XLEN) + "i_m/" + str(instructiontype) + "/"
  basename = "WALLY-" + INSTRUCTION 
  return pathname + "src/" + basename + ".S"

##################################
# main body
##################################

# change these to suite your tests
# I stands for integer extensions
REG_INSTRUCTIONS = [
  "ADD",
  "AND",
  "OR",
  "SUB",
  "SLT",
  "SLTU",
  "XOR",
]
IMM_INSTRUCTIONS = [
  "ADDI",
  "ADDIW"
]
INSTRUCTIONS = REG_INSTRUCTIONS + IMM_INSTRUCTIONS


AUTHOR = "Sean Wu (sywu@hmc.edu)"
XLENS = [64] # orig [32, 64]
NUMRAND = 3

# setup
seed(0) # make tests reproducible

# generate files for each test
for XLEN in XLENS:
  for INSTRUCTION in INSTRUCTIONS:
    TEST_COUNTER = 0
    FNAME = getFileName()
    F = open(FNAME, "w")
    writeHeader()
    writeDirectedVectors()
    writeRandomVectors()
    writeFooter()
    F.close()
