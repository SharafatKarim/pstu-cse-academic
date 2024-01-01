import java.util.Scanner;

public class Problem_15 {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        int n = sc.nextInt();
        sc.close();

        int count = 0;
        while (n != 1)
        {
            if ( n % 2 == 0 )
            {
                n = n / 2;
            }
            else
            {
                n = n / 3 + 1;
            }
            count++;
        }
        System.out.println(count);
    }
}