import java.util.Scanner;

public class Problem_01 {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        String s1 = sc.next();
        String s2 = sc.next();
        sc.close();

        String s3 = s1.substring(1) + s2.substring(2);
        System.out.println(s3);
    }
}
