import java.util.Scanner;
import java.security.SecureRandom;

public class RandGen {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        System.out.print("Enter the number of random numbers to generate: ");
        int num = scanner.nextInt();
        scanner.close();

        for (int i = 0; i < num; i++) {
            System.out.printf("%d ", getRandomInt(10, 100));
        }
    }

    private static int getRandomInt(int i, int j) {
        return i + new SecureRandom().nextInt(j - i + 1);
    }
}
