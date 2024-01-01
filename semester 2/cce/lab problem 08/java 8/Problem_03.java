import java.util.Scanner;

public class Problem_03 {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        int a = sc.nextInt();
        int b = sc.nextInt();
        int c = sc.nextInt();
        sc.close();

        if (a > b && a > c)
            System.out.println(a + " is the largest number");
        else if (b > a && b > c)
            System.out.println(b + " is the largest number");
        else
            System.out.println(c + " is the largest number");
    }
}
