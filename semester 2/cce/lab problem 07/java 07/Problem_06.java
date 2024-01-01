import java.util.Scanner;

public class Problem_06 {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        System.out.println("Enter weight in pounds and height in inches: ");
        int weight = scanner.nextInt();
        int height = scanner.nextInt();
        scanner.close();

        System.out.println("BMI is " + (weight * 0.45359237) / Math.pow((height * 0.0254), 2));
    }
}
