import java.util.Scanner;

public class Problem_02 {
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

        if ( (a+b)==c )
        {
            System.out.println("The result is: " + true);
        }
        else
        {
            System.out.println("The result is: " + false);
        }
    }
}
