import java.util.Scanner;

public class Problem_13 {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        int a, b;
        System.out.print("Input the first integer: ");
        a = sc.nextInt();
        System.out.print("Input the second integer: ");
        b = sc.nextInt();
        sc.close();

        if (a > b) {
            a = a + b;
            b = a - b;
            a = a - b;
        }

        if (a == b)
            System.out.println(0);
        else if (a % 6 == b % 6)
            System.out.println(a);
        else
            System.out.println(b);

    }
}
