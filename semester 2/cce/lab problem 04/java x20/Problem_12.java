import java.util.Scanner;

public class Problem_12 {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        int a, b, c;
        System.out.print("Input the first integer: ");
        a = sc.nextInt();
        System.out.print("Input the second integer: ");
        b = sc.nextInt();
        System.out.print("Input the third integer: ");
        c = sc.nextInt();
        sc.close();

        if ( (Math.abs(b-c) > a && a > 20) || (Math.abs(a-c) > b && b > 20) || (Math.abs(b-a) > c && c > 20) )
        {
            System.out.println("The result is: " + true);
        }
        else
        {
            System.out.println("The result is: " + false);
        }
    }
}
