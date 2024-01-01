import java.util.Scanner;

public class Problem_9 {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        System.out.print("Input the first character range: ");
        char a = sc.next().charAt(0);
        System.out.print("Input the second character range: ");
        char b = sc.next().charAt(0);
        sc.close();

        for (char i = a; i <= b; i++) {
            System.out.print(i + " ");
        }
    }
}
