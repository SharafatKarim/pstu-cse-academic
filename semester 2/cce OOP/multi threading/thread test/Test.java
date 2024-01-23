class MultiThreading extends Thread {
    int n;

    public void run() {
        for (int i = 0; i < n; i++)
            ;
        System.out.println(n + " times looped with mulit threading.");
    }

    public MultiThreading(int n) {
        this.n = n;
    }
}

public class Test {
    static void loop(int n) {
        for (int i = 0; i < n; i++)
            ;
        System.out.println(n + " times looped without mulit threading.");
    }

    public static void main(String[] args) {
        loop(1000);
        loop(100);
        loop(10);
        loop(1);

        System.out.println("-----------------");

        MultiThreading m_1000 = new MultiThreading(1000);
        MultiThreading m_100 = new MultiThreading(100);
        MultiThreading m_10 = new MultiThreading(10);
        MultiThreading m = new MultiThreading(1);

        m_1000.start();
        m_100.start();
        m_10.start();
        m.start();
    }
}
