public class thread {

    public static void main(String[] args) {
        runWithoutThreads();
        runWithThreads();
    }

    private static void runWithoutThreads() {
        System.out.println("Running loops without threading:");

        runLoop("Loop 1", 1000);
        runLoop("Loop 2", 100);
        runLoop("Loop 3", 10);
        runLoop("Loop 4", 1);
    }

    private static void runWithThreads() {
        System.out.println("\nRunning loops with threading:");

        Thread t1 = new Thread(() -> runLoop("Loop 1", 1000));
        Thread t2 = new Thread(() -> runLoop("Loop 2", 100));
        Thread t3 = new Thread(() -> runLoop("Loop 3", 10));
        Thread t4 = new Thread(() -> runLoop("Loop 4", 1));

        t1.start();
        t2.start();
        t3.start();
        t4.start();
    }

    private static void runLoop(String loopName, int iterations) {
        for (int i = 1; i <= iterations; i++) {
            
            if (i == iterations) {
                System.out.println(loopName + " - Iteration: " + i + " - Thread ID: " + Thread.currentThread().getId());
            }

            try {
                Thread.sleep(1);
            } catch (InterruptedException e) {
                e.printStackTrace();
            }
        }
    }
}