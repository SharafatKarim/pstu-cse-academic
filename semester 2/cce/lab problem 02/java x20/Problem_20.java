import java.util.Scanner;

public class Problem_20 {
    public static void main(String[] args) {
        int decimal;
        Scanner in = new Scanner(System.in);
        System.out.print("Input a decimal number: ");
        decimal = in.nextInt();
        in.close();

        String hex = Integer.toHexString(decimal);
        System.out.println("Hexadecimal number is: " + hex);
    }
}
