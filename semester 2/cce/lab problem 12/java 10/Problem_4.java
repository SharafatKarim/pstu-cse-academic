import java.util.Scanner;
public class Problem_4 {

    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        System.out.print("Original string: ");
        String str = sc.nextLine();
        System.out.print("Character initial position: ");
        int pos = sc.nextInt();
        System.out.print("Character final position: ");
        int pos2 = sc.nextInt();
        sc.close();

        int sum = 0;
        for (int i = 0; i < str.length(); i++) {
            if (i >= pos && i <= pos2) {
                sum += str.codePointAt(i);
            }
        }
        System.out.println("Sum of the characters between the initial and final position = " + sum);
    }
}