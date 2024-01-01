import java.util.Scanner;

public class Problem_04 {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        int a, b, c;
        int rightmost_digit_a, rightmost_digit_b, rightmost_digit_c;
        System.out.print("Input the first integer: ");
        a = sc.nextInt();
        System.out.print("Input the second integer: ");
        b = sc.nextInt();
        System.out.print("Input the third integer: ");
        c = sc.nextInt();
        sc.close();

        rightmost_digit_a = a % 10;
        rightmost_digit_b = b % 10;
        rightmost_digit_c = c % 10;

        if (rightmost_digit_a == rightmost_digit_b || rightmost_digit_a == rightmost_digit_c || rightmost_digit_b == rightmost_digit_c)
        {
            System.out.println("The result is: " + true);
        }
        else
        {
            System.out.println("The result is: " + false);
        }
    }
}
