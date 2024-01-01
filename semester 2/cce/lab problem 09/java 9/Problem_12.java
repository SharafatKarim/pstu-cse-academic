import java.util.Random;
import java.util.Scanner;

public class Problem_12 {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        System.out.print("Input the number: ");
        int n = scanner.nextInt();
        scanner.close();

        matrix_gen(n);
    }

    static void matrix_gen(int n)
    {
        for (int i = 0; i < n; i++) 
        {
            for (int j = 0; j < n; j++)
            {
                System.out.print(new Random().nextInt(2) + " ");
            }
            System.out.println();
        }
    }
}
