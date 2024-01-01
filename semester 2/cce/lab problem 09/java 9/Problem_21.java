import java.util.Scanner;

public class Problem_21 {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        System.out.print("Input the number: ");
        int n = sc.nextInt();
        sc.close();

        factor_of_three(n);
    }

    public static void factor_of_three(int n) {
        System.out.print("n= ");
        while (n % 3 == 0)
        {
            System.out.print("3*");
            n /= 3;
        }
        System.out.println(n);
    }
}
