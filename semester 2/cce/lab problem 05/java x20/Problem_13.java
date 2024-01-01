import java.util.Scanner;

public class Problem_13 {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        String str = sc.next();
        sc.close();

        StringBuffer str2 = new StringBuffer();
        str2.append(str.substring(str.length()-3));
        str2.append(str);
        str2.append(str.substring(str.length()-3));

        System.out.println(str2);
    }
}
