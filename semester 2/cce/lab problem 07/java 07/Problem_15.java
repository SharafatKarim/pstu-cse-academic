import java.util.Scanner;

public class Problem_15 {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        Double number = scanner.nextDouble();
        scanner.close();

        System.out.println("Next up " + Math.nextUp(number));
        System.out.println("Next down " + Math.nextDown(number));
    }
}
