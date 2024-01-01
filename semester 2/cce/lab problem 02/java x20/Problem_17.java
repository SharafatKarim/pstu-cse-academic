import java.util.Scanner;

public class Problem_17 {
    public static void main(String[] args) {
        System.out.println("Input the first binary number: ");
        Scanner in = new Scanner(System.in);
        String a = in.nextLine();
        System.out.println("Input the second binary number: ");
        String b = in.nextLine();
        in.close();

        int a_dec = Integer.parseInt(a, 2);
        int b_dec = Integer.parseInt(b, 2);
        int c_dec = a_dec + b_dec;
        String c = Integer.toBinaryString(c_dec);

        System.out.println("Sum of two binary numbers: " + c);
    }
}
