import java.util.Scanner;

public class Problem_11 {
    public static void main(String[] args) {
        Scanner in = new Scanner(System.in);
        System.out.print("Enter your string: ");
        var s = in.nextLine();
        in.close();

        StringBuffer reversed = new StringBuffer(s);

        for ( int i = 0; i < reversed.length() / 2; i++ )
        {
            char temp = reversed.charAt(i);
            reversed.setCharAt(i, reversed.charAt(reversed.length() - i - 1));
            reversed.setCharAt(reversed.length() - i - 1, temp);
        }

        System.out.println("Inversed string: " + reversed);
    }
}
