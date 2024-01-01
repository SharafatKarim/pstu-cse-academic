import java.util.Scanner;

/**
 * Problem_8
 */
public class Problem_8 {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        int a = scanner.nextInt();
        scanner.close();

        if (a%9 == 0)
            System.out.println(9);
        else
            System.out.println(a%9);
    }
}