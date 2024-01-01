import java.util.Scanner;

public class Problem_12 {
    public static void main(String[] args) {
        int a, b, c;
        Scanner in = new Scanner(System.in);
        System.out.print("Input first number: ");
        a = in.nextInt();
        System.out.print("Input second number: ");
        b = in.nextInt();
        System.out.print("Input third number: ");
        c = in.nextInt();
        in.close();

        System.out.println("The average of " + a + ", " + b + ", and " + c + " is " + (a + b + c) / 3);
    }
}
