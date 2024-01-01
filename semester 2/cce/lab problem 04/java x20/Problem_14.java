import java.util.Scanner;

public class Problem_14 {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        int a, b;
        System.out.print("Input the first integer: ");
        a = sc.nextInt();
        System.out.print("Input the second integer: ");
        b = sc.nextInt();
        sc.close();

        boolean c = false;
        int a1 = a % 10;
        int a2 = a / 10;
        int b1 = b % 10;
        int b2 = b / 10;

        if (a1 == b1 || a1 == b2 || a2 == b1 || a2 == b2)
            c = true;
        System.out.println(c);
    }
}
