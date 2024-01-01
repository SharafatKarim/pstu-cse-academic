import java.util.Scanner;

/**
 * Problem_13
 */
public class Problem_13 {

    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        Double first_number = scanner.nextDouble();
        Double second_number = scanner.nextDouble();
        scanner.close();

        System.out.println(Math.floor(first_number / second_number));
        System.out.println(Math.floor(first_number % second_number));
    }
}