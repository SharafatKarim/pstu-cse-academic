import java.util.Scanner;

public class Problem_09 {
    public static void main(String[] args) {
        System.out.print("Input a string: ");
        Scanner in = new Scanner(System.in);
        var a = in.nextLine();
        in.close();

        // print lowercase
        for ( int i = 0; i < a.length(); i++ )
        {
            if ( 'A' <= a.charAt(i) && a.charAt(i) <= 'Z' )
                System.out.print((char)(a.charAt(i) + 32));
            else
                System.out.print(a.charAt(i));
        }
    }
}
