import java.util.Scanner;

public class Problem_01 {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        int a, b;
        System.out.print("Enter first integer: ");
        a = sc.nextInt();
        System.out.print("Enter second integer: ");
        b = sc.nextInt();
        sc.close();

        if (a > b)
            System.out.println(a + " > " + b);
        if (a >= b)
            System.out.println(a + " >= " + b);
        if (a >= b)
            System.out.println(a + " >= " + b);
        if (a <= b)
            System.out.println(a + " <= " + b);
        if (a < b)
            System.out.println(a + " < " + b);
        if (a == b)
            System.out.println(a + " == " + b);
        if (a != b)
            System.out.println(a + " != " + b);
    }
}
