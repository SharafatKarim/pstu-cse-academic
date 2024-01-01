import java.util.Scanner;

/**
 * Problem_1
 */
public class Problem_1 {

    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        System.out.print("Original string: ");
        String str = sc.nextLine();
        System.out.print("Character position: ");
        int pos = sc.nextInt();
        sc.close();

        for (int i = 0; i < str.length(); i++) {
            if (i == pos) {
                System.out.print(str.charAt(i));
            }
        }
    }
}