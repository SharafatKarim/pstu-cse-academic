import java.util.Scanner;

public class Problem_02 {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        int a;
        System.out.print("Enter your integer: ");
        a = sc.nextInt();
        sc.close();

        int sum = 0;
        while (a > 0)
        {
            sum += a % 10;
            a = a / 10;
        }

        System.out.println("Sum is : " + sum);
    }
}
