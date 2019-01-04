
package ParallelPJ2;
import parallel.*;
import edu.rit.pj2.LongLoop;
import edu.rit.pj2.Task;
import edu.rit.pj2.vbl.LongVbl;
import java.util.Random;
import java.util.Scanner;

public class PiParallel extends Task {
    long N;
    long seed;
    // u write your code in an instance method called main 
    // your class extend Task 
    @Override
    public void main(String[] args) throws Exception {
       if (args.length != 2) usage();
        seed = Long.parseLong (args[0]); // read seed from command line 
        N = Long.parseLong (args[1]); // read N from command line 
        double x, y;
        LongVbl count = new LongVbl.Sum(0);
        parallelFor(0, N - 1).exec(new LongLoop() {
            LongVbl countPerThread;
            edu.rit.util.Random r;
            
            /**
             * start() is called to initialize each thread team member 
             * @throws Exception 
             */
            @Override
            public void start() throws Exception {
                countPerThread = threadLocal(count); // used to link sums in then used in reduction 
                r = new edu.rit.util.Random(seed + rank());   // get pesudorandom generator unique fo each team member       
            }
            @Override
            public void run(long l) throws Exception {
                double x, y;
                // get two random x,y axis
                    x = r.nextDouble(); 
                    y = r.nextDouble();
                    if ((x * x + y * y) <= 1) {
                        ++countPerThread.item;  // this point is inside quarter of circle 
                    } 
            }
        });

        double d = 4.0 * count.item / N; // compute PI 
        System.out.println("PI = " + d);

    }

    private void usage() {
    }

}
