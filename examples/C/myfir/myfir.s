# sum.s
# sywu@hmc.edu 4 September 2023
# Add up numbers from 1 to N.

# i in s0, n in s1, sum in s2,
# N in a0, M in a1, X in a2, c in a3, Y in a4
# void fir(int N, int M, double X[], double c[], double Y[]) {
#   int i, n;
#   double sum; 

#   for (n=0; n<N; n++) {
#       sum = 0;
#       for (i=0; i<M; i++) {
#           sum += c[i]*X[n-i+(M-1)];
#       }
#       Y[n] = sum;
#   }
# }

.global fir
fir:
    addi sp, sp, -24    # make stack space for i, n, sum (8 bytes each)
    sd s0, 0(sp)        # store double word (RV64I) to save s0, s1, s2 
    sd s1, 8(sp)        # offset by 8 bytes
    sd s2, 16(sp)
    li s1, 0            # n = 0
for0:
    bge s1, a0, done    # done if n >= N
    li s2, 0            # sum = 0
    li s0, 0            # i = 0
    addi sp, sp, -8     # allocate stack space for return address `ra`
    sd ra, 0(sp)        # save `ra` to stack before `jal`
    jal for1            # go to inner loop, come back right here
    ld ra, 0(sp)        # load `ra` from stack
    addi sp, sp, 8      # unallocate stack space for `ra`
    addi s1, s1, 1      # n++
    j for0
for1:
    bge s0, a1, for1_exit   # back to for0 after jal if i >= M
    slli t0, s0, 3          # t0 = i*8
    add t0, a3, t0          # t0 = &c[i]
    ld t1, 0(t0)            # t1 = c[i]
    sub t0, s1, s1          # t0 = n - i
    add t0, t0, a1          # t0 = n - i + M
    addi t0, t0, -1         # t0 = n - i + M - 1
    slli t0, s0, 3          # t0 = i*8
    add t0, a2, t0          # t0 = &X[i]
    ld t2, 0(t0)            # t2 = X[n-i+M-1]
    mul t1 
    addi s0, s0, 1          # i++
    j for1
for1_exit:
    ret
done:                   # no return statement, so no `mv _ a0`
    ld s0, 0(sp)
    ld s1, 8(sp)
    ld s2, 16(sp)
    addi sp, sp, 24
    ret

    


