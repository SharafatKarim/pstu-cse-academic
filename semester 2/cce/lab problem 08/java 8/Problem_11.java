import java.util.Scanner;

public class Problem_11 {
    public static void main(String[] args) {
        Scanner  scan = new Scanner(System.in);
        int n = scan.nextInt();
        scan.close();

        int sum = 0;
        for (int i = 1; i <= n; i++)
        {
            System.out.println(i);
            sum += i;
        }
        System.out.println("Sum of the numbers from 1 to " + n + " is " + sum);
    }
}
