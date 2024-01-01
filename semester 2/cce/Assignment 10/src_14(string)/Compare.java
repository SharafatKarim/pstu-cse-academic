import java.util.Scanner;

public class Compare {
    public static void main(String[] args) {
        Scanner input = new Scanner(System.in);
        System.out.println("Enter first string: ");
        String s1 = input.nextLine();
        System.out.println("Enter second string: ");
        String s2 = input.nextLine();
        System.out.println("Enter number of characters to be compared: ");
        int n = input.nextInt();
        System.out.println("Enter starting index of the comparison: ");
        int i = input.nextInt();
        input.close();

        if (s1.regionMatches(true, i, s2, i, n)) {
            System.out.println("The strings are equal.");
        } else {
            System.out.println("The strings are not equal.");
        }
    }
}
