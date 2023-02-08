// multiply.c
// David_Harris@hmc.edu 20 January 2022
// Finite Impulse Response Filter

#include <stdio.h>  // supports printf
#include <math.h>   // supports fabs
#include "util.h"   // supports verify

#define N 40

// naive algorithm is fast for small matrices
void multiply(double A[N][N], double B[N][N], double M[N][N]) {
  double sum;
  for (int row=0; row<N; row++) {
      for (int col=0; col<N; col++) {
          sum = 0;
          for (int i=0; i<N; i++) {
              sum += A[row][i] * B[i][col];
          }
          M[row][col] = sum;
      }
  }
}

int main(void) {
    printf("N=%d\n", N);
    double A[N][N];
    double B[N][N];
    double M[N][N];
    for (int i=0; i<N; i++) {
        for (int j=0; j<N; j++) {
            A[i][j] = i + i*j;
            B[i][j] = j + i*j;
        }
    }

    setStats(1);
    multiply(A, B, M);
    setStats(0);
    
    // library linked doesn't support printing doubles, so convert to integers to print
    // for (int i=0; i<N; i++)  {
    //     for (int j=0; j<N; j++) {
    //       int tmp = M[i][j];
    //       printf("M[%d][%d] = %d\n", i, j, tmp);
    //     }
    // }    
    return 0;
}