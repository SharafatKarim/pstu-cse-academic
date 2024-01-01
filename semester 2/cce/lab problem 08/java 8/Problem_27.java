import java.util.Scanner;
public class Problem_27 {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        System.out.print("Enter a number: ");
        int n = scanner.nextInt();
        scanner.close();

        if (n == 0) {
            System.out.println("The number is zero");
        }
        else if (n > 0) {
            System.out.println("The number is positive");
        }
        else {
            System.out.println("The number is negative");
        }
    }
}
