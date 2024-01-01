import java.util.Scanner;

public class Problem_19 {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        System.out.print("Input the first number: ");
        int a = sc.nextInt();
        System.out.print("Input the second number: ");
        int b = sc.nextInt();
        System.out.print("Input the third number: ");
        int c = sc.nextInt();
        sc.close();
        
        if (midpoint_check(a, b, c)) {
            System.out.println("Mid exists");
        } else {
            System.out.println("Mid does not exist");
        }
    }

    public static boolean midpoint_check(int a, int b, int c) {
        int max = Math.max(Math.max(a, b), c);
        int min = Math.min(Math.min(a, b), c);
        int mid = a + b + c - max - min;

        if (mid == (int)(max + min) / 2.0) {
            return true;
        }  
        return false;
    }
}
