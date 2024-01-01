import java.util.Scanner;

public class Problem_02 {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        String s1 = sc.next();
        sc.close();

        StringBuilder s2 = new StringBuilder();
        int len = s1.length();
        if (len < 3)
        {
            s2.append(s1);
            for (int i = 0; i < 3 - len; i++)
                s2.append("#");
        }
        else
        {
            s2.append(s1.substring(0, 3));
        }
        System.out.println(s2);
    }
}
