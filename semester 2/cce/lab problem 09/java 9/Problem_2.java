import java.util.Scanner;

/**
 * Problem_2
 */
public class Problem_2 {

    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        System.out.print("Input the first number: ");
        int a = sc.nextInt();
        System.out.print("Input the second number: ");
        int b = sc.nextInt();
        System.out.print("Input the third number: ");
        int c = sc.nextInt();
        sc.close();

        System.out.println("The average is " + (a + b + c) / 3.0);
    }
}