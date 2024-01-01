import java.util.Scanner;

public class Problem_15 {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        int a, b;
        System.out.print("Input the first integer: ");
        a = sc.nextInt();
        System.out.print("Input the second integer: ");
        b = sc.nextInt();
        sc.close();

        int c = a / b;
        int d = c * b;
        int e = a - d;
        System.out.println(e);
    }
}
