// package com.company;
class Hello extends Thread{
    private int n;
    public Hello(int n)
    {
        this.n = n;
    }
    public void run(){
        for(int i=0;i<n;i++) {
            System.out.println(n + " times loop with multithreading");
        }
    }
}

public class Monir {
    public static void main(String[] args) {
        Hello h1 = new Hello(1000);
        Hello h2 = new Hello(100);
        Hello h3 = new Hello(10);
        Hello h4 = new Hello(1);
        h1.start();
        h2.start();
        h3.start();
        h4.start();
     

    }
}
