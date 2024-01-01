import java.util.Scanner;

public class Problem_15 {
    public static void main(String[] args) {
        int a, b;
        Scanner in = new Scanner(System.in);
        System.out.print("Input first number: ");
        a = in.nextInt();
        System.out.print("Input second number: ");
        b = in.nextInt();
        in.close();

        int c;
        c = a;
        a = b;
        b = c;

        System.out.println("a = " + a);
        System.out.println("b = " + b);
    }
}
