import java.util.Scanner;
public class Problem_25 {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        System.out.print("Enter the number of rows: ");
        int rows = scanner.nextInt();
        scanner.close();

        for (int i = 1; i <= rows * 2; i+=2) {
            for (int j = i; j <= rows * 2; j++) {
                System.out.print(" ");
            }
            for (int j= i/2; j >= 1; j--) {
                System.out.print(j + " ");
            }
            for (int j = 2; j <= i/2; j++) {
                System.out.print(j + " ");
            }
            System.out.println();
        }
        for (int i = rows * 2 ; i >= 1; i-=2) {
            for (int j = i; j <= rows * 2; j++) {
                System.out.print(" ");
            }
            for (int j= i/2; j >= 1; j--) {
                System.out.print(j + " ");
            }
            for (int j = 2; j <= i/2; j++) {
                System.out.print(j + " ");
            }
            System.out.println();
        }
    }
}
