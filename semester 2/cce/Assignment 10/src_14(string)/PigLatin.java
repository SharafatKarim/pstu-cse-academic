import java.util.Scanner;

public class PigLatin {
    public static void main(String[] args) {
        Scanner input = new Scanner(System.in);
        System.out.println("Enter a sentence: ");
        String sentence = input.nextLine();
        input.close();
        
        String[] words = sentence.split(" ");
        for (String word : words) {
            System.out.print(word.substring(1) + word.charAt(0) + "ay ");
        }
    }
}