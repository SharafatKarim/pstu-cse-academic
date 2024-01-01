import java.util.Scanner;

public class Problem_22 {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        System.out.print("Input the number: ");
        int n = sc.nextInt();
        sc.close();

        every_digit_even(n);
    }

    public static void every_digit_even(int n) {
        while (n > 0) {
            if ((n % 10) % 2 != 0) {
                System.out.println("Not all digits are even");
                return;
            }
            n /= 10;
        }
        System.out.println("All digits are even");
    }
}
