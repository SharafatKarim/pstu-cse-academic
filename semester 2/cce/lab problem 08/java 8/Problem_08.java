import java.util.Scanner;

public class Problem_08 {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        System.out.print("Enter an alphabet: ");
        Character ch = sc.next().charAt(0);
        sc.close();

        if (Character.isAlphabetic(ch))
        {
            ch = Character.toLowerCase(ch);
            if (ch == 'a' || ch == 'e' || ch == 'i' || ch == 'o' || ch == 'u')
                System.out.println("Vowel");
            else
                System.out.println("Consonant");
        }
        else
            System.out.println("Not an alphabet");
    }
}
