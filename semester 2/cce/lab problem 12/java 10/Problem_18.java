import java.util.Scanner;

public class Problem_18 {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        String str = sc.nextLine();
        sc.close();

        System.out.println(str.hashCode());
    }
}
