import java.util.Scanner;

public class Problem_02 {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        int a = sc.nextInt();
        int b = sc.nextInt();
        int c = sc.nextInt();
        sc.close();

        int d = b * b - 4 * a * c;
        if (d > 0)
            System.out.println("Real and Distinct");
        else if (d == 0)
            System.out.println("Real and Equal");
        else
            System.out.println("Imaginary");

        System.out.println("Roots are: " + (-b + Math.sqrt(d)) / (2 * a) + " and " + (-b - Math.sqrt(d)) / (2 * a));
    }
}
