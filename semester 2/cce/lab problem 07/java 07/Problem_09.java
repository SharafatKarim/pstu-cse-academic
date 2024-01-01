import java.util.Scanner;

public class Problem_09 {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        System.out.print("Enter the first integer: ");
        int first = scanner.nextInt();
        System.out.print("Enter the second integer: ");
        int second = scanner.nextInt();
        scanner.close();

        System.out.println("Sum: " + (first + second));
        System.out.println("Difference: " + (first - second));
        System.out.println("Product: " + (first * second));
        System.out.println("Average: " + (first + second) / 2);
        System.out.println("Distance: " + Math.abs(first - second));
        System.out.println("Maximum: " + Math.max(first, second));
        System.out.println("Minimum: " + Math.min(first, second));
    }
}
