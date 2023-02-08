# fir.S
# sywu@hmc.edu 4 September 2023
# An M-tap Finite Impulse Response filter computes an N-element
# output sequence:
# Y[n] = \sum_(t=0)^(M-1){c[i]X[n-i+(M-1)]}

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
    add t0, a4, zero    # t0 is &Y[0]
    addi t1, a0, -1     # N-1
    slli t1, a0, 3      # (N-1)*8
    add t1, a4, t1      # t1 is Y[N-1]
    addi t2, a1, -1     # M-1
    slli t3, t2, 3      # (M-1)*8
    add t2, a2, t3      # t2 is &X[M-1]
    add t3, a3, t3      # t3 is &c[M-1]
outer_start:
    fmv.d.x ft0, zero   # sum = 0
    add t4, a3, zero    # t4 reset to &c[0]
    add t5, t2, zero    # t5 reset to &X[n-0+M-1]
inner:
    fld ft1, 0(t4)              # ft1 is c[i]
    fld ft2, 0(t5)              # X[n-i+M-1]
    fmadd.d ft0, ft1, ft2, ft0  # sum += c[i] * X[n-i+M-1]  
    addi t4, t4, 8              # i++ in c[i]
    addi t5, t5, -8             # i-- in X[n-i+M-1]
    ble t4, t3, inner           # loop if i < M via c[i]
outer_end:
    fsd ft0, 0(t0)              # Y[n] = sum
    addi t0, t0, 8              # n++ in Y[n]
    addi t2, t2, 8              # n++ in X[n-i+M-1] 
    blt t0, t1, outer_start     # loop if n < N via Y[n]
done:
    ret

    


