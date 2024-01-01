import java.util.Scanner;

public class Problem_11 {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        System.out.print("Enter your password: ");
        if (checkPassword(sc.next())) {
            System.out.println("Valid password");
        } else {
            System.out.println("Invalid password");
        }
        sc.close();
    }

    public static boolean checkPassword(String password) {
        if (password.length() < 10) {
            return false;
        }
        int digits = 0;

        boolean hasDigit = false;
        boolean hasLetter = false;
        for (int i = 0; i < password.length(); i++) {
            if (Character.isDigit(password.charAt(i))) {
                hasDigit = true;
                digits++;
            } else if (Character.isLetter(password.charAt(i))) {
                hasLetter = true;
            }
        }
        boolean twoDigits = false;
        if (digits >= 2) {
            twoDigits = true;
        }
        return hasDigit && hasLetter && twoDigits;
    }
}
