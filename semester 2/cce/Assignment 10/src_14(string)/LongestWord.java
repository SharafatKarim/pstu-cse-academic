import java.util.Scanner;

public class LongestWord {
    public static void main(String[] args) {
        Scanner input = new Scanner(System.in);
        System.out.println("Enter a sentence: ");
        String sentence = input.nextLine();
        input.close();

        String[] words = sentence.split(" ");
        int maxLength = 0;
        String longest_word = "";
        for (String word : words) {
            if (word.length() > maxLength) {
                longest_word = word;
                maxLength = word.length();
            }
        }

        System.out.println("The longest word is: " + longest_word);
    }
}