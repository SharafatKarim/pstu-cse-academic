import java.util.Scanner;

public class Problem_31 {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        int a = sc.nextInt();
        int b = sc.nextInt();
        int c = sc.nextInt();
        sc.close();

        if (a > b && b > c)
            System.out.println("Increasing");
        else if (a < b && b < c)
            System.out.println("Decreasing");
        else
            System.out.println("Neither increasing or decreasing order");
    }
}
