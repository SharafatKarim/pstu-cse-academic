import java.util.Scanner;

public class Problem_23 {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        System.out.print("Input the string: ");
        String s = sc.nextLine();
        sc.close();

        if (check_vowel(s))
            System.out.println("The string contains only vowels.");
        else
            System.out.println("The string does not contain only vowels.");
    }

    public static boolean check_vowel(String s) {
        for (int i = 0; i < s.length(); i++) {
            s = s.toLowerCase();
            if (!(s.charAt(i) == 'a' ||
                    s.charAt(i) == 'e' ||
                    s.charAt(i) == 'i' ||
                    s.charAt(i) == 'o' ||
                    s.charAt(i) == 'u'))
                return false;
        }
        return true;
    }
}
