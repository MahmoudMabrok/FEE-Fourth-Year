/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ParallelPJ2;

import ParallelGpu.*;
import edu.rit.gpu.CacheConfig;
import edu.rit.gpu.Kernel;
import edu.rit.gpu.Gpu;
import edu.rit.gpu.GpuDoubleArray;
import edu.rit.gpu.GpuDoubleMatrix;
import edu.rit.gpu.Module;
import edu.rit.pj2.Task;
import edu.rit.util.Random;

public class OuterProductGpu
        extends Task {

    private static interface OuterProductKernel
            extends Kernel {

        /**
         * kernel function to compute outer product used to be mirrored with
         * C-kernel function
         *
         * @param a
         * @param b
         * @param c
         * @param N
         */
        public void outerProduct(GpuDoubleArray a,
                GpuDoubleArray b,
                GpuDoubleMatrix c,
                int N);
    }
    // GPU kernel block dimensions = NT x NT threads.
    private static final int NT = 32;

    public void main(String[] args)
            throws Exception {
        long t1 = System.currentTimeMillis();
//        if (args.length != 2) {
//            usage();
//        }
        long seed = Long.parseLong("1122");
        int N = Integer.parseInt("1000000");

        Gpu gpu = Gpu.gpu();
        gpu.ensureComputeCapability(2, 0);

        Random prng = new Random(seed);
        GpuDoubleArray a = gpu.getDoubleArray(N);
        GpuDoubleArray b = gpu.getDoubleArray(N);
        GpuDoubleMatrix c = gpu.getDoubleMatrix(N, N);
        //fill with random data 
        for (int i = 0; i < N; ++i) {
            a.item[i] = prng.nextDouble() * 20.0 - 10.0;
            b.item[i] = prng.nextDouble() * 20.0 - 10.0;
        }
        // transfer data from CPU to GPU memory  ( Host is Cpu , Device is GPU )
        a.hostToDev();
        b.hostToDev();

        //   Module module = gpu.getModule("edu/rit/gpu/example/OuterProductGpu.cubin");
        Module module = gpu.getModule("ParallelGpu/OuterProductGpu.cubin");

        OuterProductKernel kernel
                = module.getKernel(OuterProductKernel.class);
        kernel.setBlockDim(NT, NT);
        kernel.setGridDim((N + NT - 1) / NT, (N + NT - 1) / NT);
        kernel.setCacheConfig(CacheConfig.CU_FUNC_CACHE_PREFER_L1);
        long t2 = System.currentTimeMillis();
        kernel.outerProduct(a, b, c, N);
        long t3 = System.currentTimeMillis();

        c.devToHost();
        // First two element in A
        System.out.printf("a[%d] = %.5f%n", 0, a.item[0]);
        System.out.printf("a[%d] = %.5f%n", 1, a.item[1]);
        // First two element in B
        System.out.printf("b[%d] = %.5f%n", 0, b.item[0]);
        System.out.printf("b[%d] = %.5f%n", 1, b.item[1]);
        //First two element in C (Result)
        System.out.printf("c[%d][%d] = %.5f%n",
                0, 0, c.item[0][0]);
        System.out.printf("c[%d][%d] = %.5f%n",
                0, 1, c.item[0][1]);

        long t4 = System.currentTimeMillis();
        
        System.out.printf("%d msec pre%n", t2 - t1);
        System.out.printf("%d msec calc%n", t3 - t2);
        System.out.printf("%d msec post%n", t4 - t3);
        System.out.printf("%d msec total%n", t4 - t1);
    }
// Print a usage message and exit.

    private static void usage() {
        System.err.println("Usage: java pj2 "
                + "edu.rit.gpu.example.OuterProductGpu <seed> <N>");
        System.err.println("<seed> = Random seed");
        System.err.println("<N> = Vector length");
        terminate(1);
    }
// Specify that this task requires one core.

    protected static int coresRequired() {
        return 1;
    }
// Specify that this task requires one GPU accelerator.

    protected static int gpusRequired() {
        return 1;
    }
}
