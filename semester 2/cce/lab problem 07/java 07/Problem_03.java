import java.util.Scanner;

public class Problem_03 {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        int number = sc.nextInt();
        sc.close();

        int sumofdigits = 0;
        while (number > 0) {
            sumofdigits += number % 10;
            number /= 10;
        }

        System.out.println("The sum of all digits is " + sumofdigits);
    }
}
