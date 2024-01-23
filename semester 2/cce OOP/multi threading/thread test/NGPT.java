public class NGPT {
  
    public static void main(String[] args) {
       int iterations[] = {1000,100,10,1};
       
        System.out.println("Runnig loops sequentially without thread");
        for (int i = 0; i <iterations.length ; i++) {
            int count = iterations[i];
            
            long startTime = System.currentTimeMillis();
            runLoop(count);
            
            long endTime = System.currentTimeMillis();
            
            System.out.println("Loop "+(i+1) +" finished in "+(endTime - startTime) +" mls");
        }
        
        System.out.println("\n\nRunning loops with threading ");
        for (int i = 0; i < iterations.length; i++) {
            int count = iterations[i];
            long stratTime = System.currentTimeMillis();
            Thread thread = new Thread(() -> runLoop(count));
            thread.start();
            
            try{
                thread.join();
            }
            catch(InterruptedException e){
                e.printStackTrace();
            }
            
            long endTime = System.currentTimeMillis();
            System.out.println("Loop "+(i+1) +" finished in "+(endTime - stratTime) +" mls");

        }
        
    }
    static void runLoop(int count)
    {
        for (int i = 0; i < count; i++) {
            double res = Math.sin(i) * Math.cos(i);
        }
    }
}
