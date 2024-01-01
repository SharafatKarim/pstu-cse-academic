import java.util.Scanner;

public class Problem_9 {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        int n = scanner.nextInt();
        scanner.close();

        for (int k = 1; n > 0; k++)
        {
            for (int j=0; j < k; j++)
            {
                n--;
                if (n < 0)
                break;
                System.out.print("$");
            }
            System.out.println();
        }
    }
}
