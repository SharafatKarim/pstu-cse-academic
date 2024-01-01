import java.util.Scanner;

public class Problem_29 {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        float n = sc.nextFloat();
        sc.close();

        int digit_number = 0;
        int temp = (int) n;
        while (temp != 0) {
            temp /= 10;
            digit_number++;
        }

        System.out.println("The number of digits in " + n + " is " + digit_number);
    }
}
