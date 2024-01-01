import java.util.Scanner;

public class Problem_10 {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        int n = scanner.nextInt();
        scanner.close();

        int pow = 4;
        int i = 1;
        while (pow <= n) {
            pow = (int)Math.pow(4, i++);
            if (pow == n)
            {
                System.out.println(true);
                System.exit(0);
            }
        }
        System.out.println(false);
    }
}
