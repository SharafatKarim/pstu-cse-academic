public class Moon {
    public static void main(String[] args) {
        Thread thread1 = new Thread(new LoopRunner(1000, "1st Loop"));
        Thread thread2 = new Thread(new LoopRunner(100, "2nd Loop"));
        Thread thread3 = new Thread(new LoopRunner(10, "3rd Loop"));
        Thread thread4 = new Thread(new LoopRunner(1, "4th Loop"));

        thread1.start();
        thread2.start();
        thread3.start();
        thread4.start();
    }

    static class LoopRunner implements Runnable {
        private final int iterations;
        private final String loopName;

        LoopRunner(int iterations, String loopName) {
            this.iterations = iterations;
            this.loopName = loopName;
        }

        @Override
        public void run() {
            for (int i = 0; i < iterations; i++) {
                System.out.println(loopName + ": Iteration " + (i + 1));
            }
        }
    }
}