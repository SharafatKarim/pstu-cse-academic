/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
// package com.mycompany.multithread;

/**
 *
 * @author user
 */
class Multi extends Thread{
    int num;
    public void run(){
        for (int i = 0; i < num; i++)
            System.out.println("with multi threading loop no."+num+".");  
        }
        public Multi(int num){
            this.num = num;
        }
    }

public class Mainul {
    static void loop(int num){
        for (int i = 0; i < num; i++) 
            System.out.println("without multi threating loop no."+num); 
        
    }
    public static void main(String[] args) {
        loop(1000);
        loop(100);
        loop(10);
        loop(1);
        System.out.println("*********************");
        System.out.println("*********************");
        Multi loop1 = new Multi(1000);
        Multi loop2 = new Multi(100);
        Multi loop3 = new Multi(10);
        Multi loop4 = new Multi(1);
        
        loop1.start();
        loop2.start();
        loop3.start();
        loop4.start();
    }
}
