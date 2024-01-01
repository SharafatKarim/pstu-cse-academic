import java.util.Scanner;

public class Problem_15 {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        Integer n = sc.nextInt();
        sc.close();

        Integer rev = 0, n2 = n;
        while (n2 > 0)
        {
            rev = rev * 10 + n2 % 10;
            n2 = n2 / 10;
        }

        if (n == rev)
            System.out.println("Pallindrome");
            else
            System.out.println("Not a pallindrome");
    }
}
