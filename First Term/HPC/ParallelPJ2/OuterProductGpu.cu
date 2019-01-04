extern "C" __global__ void outerProduct
(double *a,
double *b,
double **c,
int N)
{
int row = blockIdx.y*blockDim.y + threadIdx.y; // compute row 
int col = blockIdx.x*blockDim.x + threadIdx.x; // compute column 
if (row < N && col < N)
c[row][col] = a[row]*b[col];
}

