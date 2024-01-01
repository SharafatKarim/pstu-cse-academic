import java.util.Scanner;

public class Problem_6 {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        System.out.print("Input a number: ");
        int n = sc.nextInt();
        sc.close();

        int sum_of_digits = 0;
        while (n > 0) {
            sum_of_digits += n % 10;
            n /= 10;
        }
        System.out.println("The sum of digits is " + sum_of_digits);
    }
}
