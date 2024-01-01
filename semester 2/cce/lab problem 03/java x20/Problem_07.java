import java.util.Scanner;

public class Problem_07 {
    public static void main(String[] args) {
        System.out.print("Input a string: ");
        Scanner in = new Scanner(System.in);
        var a = in.nextLine();
        in.close();

        // letter, space, number, other
        var len = a.length();

        int alpha = 0;
        int digit = 0;
        int space = 0;
        int other = 0;

        for (int i = 0; i < len; i++)
        {
            // also built in function available 
            if ((65 <= ((int)a.charAt(i)) && ((int)a.charAt(i)) <= 90) || (97 <= ((int)a.charAt(i)) && ((int)a.charAt(i)) <= 122))
                alpha++;
            else if (48 <= ((int)a.charAt(i)) && ((int)a.charAt(i)) <= 57)
                digit++;
            else if (a.charAt(i) == ' ')
                space++;
            else
                other++;
        }

        System.out.println("Alpha = " + alpha);
        System.out.println("Digit = " + digit);
        System.out.println("Space = " + space);
        System.out.println("Other = " + other);
    }
}
