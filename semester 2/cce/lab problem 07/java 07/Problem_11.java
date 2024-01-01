import java.util.Scanner;

public class Problem_11 {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        Double finite_check = scanner.nextDouble();
        scanner.close();

        if (finite_check.isInfinite()) {
            System.out.println("The number is infinite");
        } else {
            System.out.println("The number is finite");
        }
    }
}
