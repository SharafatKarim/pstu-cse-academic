import java.util.Scanner;

/**
 * Problem_01
 */
public class Problem_01 {

    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        int n = sc.nextInt();
        sc.close();

        if (n >= 0)
            System.out.println("Positive");
        else
            System.out.println("Negative");
    }
}