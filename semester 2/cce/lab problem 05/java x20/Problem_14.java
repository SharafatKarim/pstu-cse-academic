import java.util.Scanner;

public class Problem_14 {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        String str = sc.nextLine();
        String str2 = sc.next();
        sc.close();

        System.out.println(str.contains(str2));        
    }
}
