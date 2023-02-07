# sum.s
# sywu@hmc.edu 4 September 2023
# Add up numbers from 1 to N.

# i in s0, n in s1, sum in ft0,
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
    li s0, 100            # n = 0
    fcvt.d.w ft1, s0
    fld ft0, 0(a3)
    fmul.d ft0, ft0, f1
    fsd ft0, 0(a4)
    fld ft0, 40(a3)
    fmul.d ft0, ft0, f1
    fsd ft0, 8(a4)


done:                   # no return statement, so no `mv _ a0`
    ld s0, 0(sp)
    ld s1, 8(sp)
    ld s2, 16(sp)
    addi sp, sp, 24
    ret

    


