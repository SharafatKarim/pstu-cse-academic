import java.util.Scanner;

public class Problem_18 {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        System.out.print("Input the first number: ");
        int a = sc.nextInt();
        System.out.print("Input the second number: ");
        int b = sc.nextInt();
        System.out.print("Input the third number: ");
        int c = sc.nextInt();
        sc.close();
        
        if (check_constructive(a, b, c)) {
            System.out.println("The number is constructive");
        } else {
            System.out.println("The number is not constructive");
        }
    }

    public static boolean check_constructive(int a, int b, int c) {
        int max = Math.max(Math.max(a, b), c);
        int min = Math.min(Math.min(a, b), c);
        int mid = a + b + c - max - min;

        if (mid == min + 1 && max == mid + 1) {
            return true;
        }  
        return false;
    }
}
