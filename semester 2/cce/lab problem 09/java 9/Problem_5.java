import java.util.Scanner;

public class Problem_5 {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        System.out.print("Input a string: ");
        String s = sc.nextLine();
        sc.close();

        int word_count = 0;
        for (int i = 0; i < s.length(); i++) {
            if (s.charAt(i) == ' ')
                word_count++;
        }
        System.out.println("The number of words is " + (word_count + 1));
    }
}
