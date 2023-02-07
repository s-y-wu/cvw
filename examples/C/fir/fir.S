# fir.S
# sywu@hmc.edu 4 September 2023
# An M-tap Finite Impulse Response filter computes an N-element
# output sequence:
# Y[n] = \sum_(t=0)^(M-1){c[i]X[n-i+(M-1)]}

# sum in ft0, n in t1, i in t2, 
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
    addi t6, a1, -1     # set M - 1 as t6
    slli t5, t6, 3      # set 8*(M - 1) as t5
    add t0, a4, zero    # set t0 as a4
    add t6, a2, t5      # set t6 as &X[M - 1]
    add t5, a3, t5      # set t5 as c[M-1]
    addi t1, a0, -1     # set N - 1 as t1
    slli t1, a0, 3      # set t1 as (N-1)*8
    add t1, a4, t1      # set t1 as Y[N-1]
outer_start:
    fmv.d.x ft0, zero   # sum = 0
    add t3, a3, zero    # t3 = address for c[i]
    add t4, t6, zero    # set t4 as &X[M - 1]
inner:
    fld ft1, 0(t3)              # ft1 = c[i]
    addi t3, t3, 8
    fld ft2, 0(t4)              # ft2 = X[n-i+M-1]
    addi t4, t4, -8
    fmadd.d ft0, ft1, ft2, ft0  # sum += c[i] * X[n-i+M-1]   
    ble t3, t5, inner
outer_end:
    fsd ft0, 0(t0)              # Y[n] = sum
    addi t0, t0, 8              # t0 = &Y[n] 
    addi t6, t6, 8
    blt t0, t1, outer_start     # done if n >= N
done:
    ret

    


