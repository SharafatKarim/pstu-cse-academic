import java.util.Scanner;
public class Problem_2 {

    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        System.out.print("Original string: ");
        String str = sc.nextLine();
        System.out.print("Character position: ");
        int pos = sc.nextInt();
        sc.close();

        for (int i = 0; i < str.length(); i++) {
            if (i == pos) {
                System.out.print("Character(Unicode point) = " + str.codePointAt(i) + "\n");
                System.out.print("Character(Unicode point) = " + (int)str.charAt(i) + "\n");
            }
        }
    }
}