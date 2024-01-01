import java.util.Scanner;

public class Problem_05 {
    public static void main(String[] args) {
        int a, b;
        Scanner in = new Scanner(System.in);
        System.out.print("Input first number: ");
        a = in.nextInt();
        System.out.print("Input second number: ");
        b = in.nextInt();   
        in.close();
        System.out.println(a + " x " + b + " = " + a * b);
    }
}
