import java.util.Scanner;

public class Problem_13 {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        System.out.print("One side of triangle: ");
        int a = scanner.nextInt();
        System.out.print("Another side of triangle: ");
        int b = scanner.nextInt();
        System.out.print("Another side of triangle: ");
        int c = scanner.nextInt();
        scanner.close();

        System.out.println("The area of triangle is " + area(a, b, c));
    }

    static double area(int a, int b, int c) {
        double s = (a + b + c) / 2.0;
        return Math.sqrt(s * (s - a) * (s - b) * (s - c));
    }
}
