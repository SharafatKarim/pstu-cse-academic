import java.util.Scanner;

public class Problem_19 {
    public static void main(String[] args) {
        int decimal;
        Scanner in = new Scanner(System.in);
        System.out.print("Input a decimal number: ");
        decimal = in.nextInt();
        in.close();

        String binary = Integer.toBinaryString(decimal);
        System.out.println("Binary number is: " + binary);
    }
}
