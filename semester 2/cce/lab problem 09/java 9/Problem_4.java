import java.util.Scanner;

public class Problem_4 {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        System.out.print("Input a string: ");
        String s = sc.nextLine();
        sc.close();

        int count_vowels = 0;
        for (int i = 0; i < s.length(); i++) {
            char c = Character.toLowerCase(s.charAt(i));
            if (c == 'a' || c == 'e' || c == 'i' || c == 'o' || c == 'u')
                count_vowels++;
        }
        System.out.println("The number of vowels is " + count_vowels);
    }
}
