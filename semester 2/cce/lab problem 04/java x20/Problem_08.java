import java.util.Scanner;

public class Problem_08 {
    public static void main(String[] args) {
        System.out.print("Input a string: ");
        Scanner in = new Scanner(System.in);
        var a = in.nextLine();
        in.close();
        
        capitalize(a.charAt(0));
        for ( int i = 0; i < a.length(); i++ )
        {
            if ( a.charAt(i) == ' ' )
            {
                System.out.print(" ");
                System.out.print(capitalize(a.charAt(i + 1)));
                i++;
            }
            else
                System.out.print(a.charAt(i));
        }
    }

    public static char capitalize(char c)
    {
        if ( 'a' < c && c < 'z' )
            return (char)(c - 32);
        else
            return c;
    }
}
