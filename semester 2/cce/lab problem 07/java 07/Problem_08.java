import java.util.Scanner;

public class Problem_08 {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        int number = scanner.nextInt();
        scanner.close();

        System.out.println("Square: " + number * number);
        System.out.println("Cube: " + number * number * number);
        System.out.println("Fourth power: " + number * number * number * number);
    }
}
