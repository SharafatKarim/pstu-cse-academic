import java.util.Scanner;

public class Problem_03 {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        String s1 = sc.next();
        String s2 = sc.next();
        sc.close();

        StringBuilder s3 = new StringBuilder();
        if (s1.length() == 0)
            s3.append("#");
        else
            s3.append(s1.charAt(0));

        if (s2.length() == 0)
            s3.append("#");
        else
            s3.append(s2.charAt(s2.length()-1));

        System.out.println(s3);
    }
}
