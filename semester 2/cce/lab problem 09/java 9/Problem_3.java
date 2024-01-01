import java.util.Scanner;

public class Problem_3 {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        System.out.print("Input a string: ");
        String s = sc.nextLine();
        sc.close();

        int length = s.length();
        if (length % 2 == 0) {
            int middle_one = length / 2;
            int middle_two = middle_one - 1;
            System.out.println("The middle characters are " + s.charAt(middle_two) + s.charAt(middle_one));
        } else {
            int middle = length / 2;
            System.out.println("The middle character is " + s.charAt(middle));
        }
    }
}
