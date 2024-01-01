import java.util.Scanner;

public class TokeinizingTelephone {
    public static void main(String[] args) {
        Scanner input = new Scanner(System.in);
        System.out.println("Enter a telephone number: ");
        String telephoneNumber = input.nextLine();
        input.close();

        String[] tokens = telephoneNumber.split("[()\\- ]");
        String areaCode = tokens[1];
        String firstThreeDigits = tokens[3];
        String lastFourDigits = tokens[4];
        String phoneNumber = firstThreeDigits + lastFourDigits;

        System.out.println("Area code: " + areaCode);
        System.out.println("Phone number: " + phoneNumber);
    }
}
