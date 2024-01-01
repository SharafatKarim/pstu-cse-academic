import java.util.Scanner;

public class Problem_06 {
    public static void main(String[] args) {
        int x, y, p, c=0;
        Scanner in = new Scanner(System.in);
        System.out.print("x = ");
        x = in.nextInt();
        System.out.print("y = ");
        y = in.nextInt();   
        System.out.print("p = ");
        p = in.nextInt();
        in.close();

        for (int i = x; i <= y; i++)
        {
            if (i % p == 0)
            {
                c++;
            }
        }
        System.out.println(c);
    }
}
