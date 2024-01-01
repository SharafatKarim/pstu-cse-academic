import java.util.Scanner;

public class Problem_07 {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        var n = sc.nextInt();
        sc.close();
        int c = 0;

        for (int i = 1; i <= n; i++) {
            if (n % i == 0)
                c++;
        }
        System.out.println(c);
    }
}
