import java.util.Scanner;

public class Problem_26 {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        System.out.print("Enter the number of rows: ");
        int rows = scanner.nextInt();
        scanner.close();

        for (int i = 1; i <= rows; i++) {
            for (int j = i; j <= rows; j++) {
                System.out.print(" ");
            }
            for (int j = 1; j <= (i - 1); j++) {
                System.out.print((char)('A'+j-1) + " ");
            }
            for (int j= i; j >= 1; j--) {
                System.out.print((char)('A'+j-1) + " ");
            }
            System.out.println();
        }
        for (int i = rows; i >= 1; i--) {
            for (int j = i; j <= rows; j++) {
                System.out.print(" ");
            }
            for (int j = 1; j <= (i - 1); j++) {
                System.out.print((char)('A'+j-1) + " ");
            }
            for (int j= i; j >= 1; j--) {
                System.out.print((char)('A'+j-1) + " ");
            }
            System.out.println();
        }
    }
}
