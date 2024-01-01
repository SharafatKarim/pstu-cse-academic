import java.util.Scanner;

public class Problem_06 {
    public static void main(String[] args) {
        Scanner in = new Scanner(System.in);
        System.out.print("Enter your string: ");
        var s = in.nextLine();
        in.close();

        StringBuffer reversed = new StringBuffer(s);
        reversed.reverse();
        System.out.println("Inversed string: " + reversed);
    }
}
