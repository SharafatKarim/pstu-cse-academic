import java.util.Scanner;

public class Problem_12 {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        System.out.print("String : ");
        String str = sc.nextLine();
        System.out.print("String 2 : ");
        String sequence = sc.nextLine();
        sc.close();

        boolean found = true;
        for (int i = sequence.length() - 1; i >= 0; i--) {
            if (sequence.charAt(i) != str.charAt(str.length() - sequence.length() + i)) {
                found = false;
                break;
            }
        }

        if (found) {
            System.out.println("true");
        } else {
            System.out.println("false");
        }
    }
}
