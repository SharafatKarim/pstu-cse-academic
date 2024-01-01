import java.util.Scanner;

public class Problem_13 {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        System.out.print("String : ");
        String str = sc.nextLine();
        System.out.print("String 2 : ");
        String sequence = sc.nextLine();
        sc.close();

        boolean found = true;
        if (!(str.length() == sequence.length())) {
            found = false;
        } else {
            for (int i = 0; i < str.length(); i++) {
                if (str.charAt(i) != sequence.charAt(i)) {
                    found = false;
                    break;
                }
            }
        }

        if (found) {
            System.out.println("true");
        } else {
            System.out.println("false");
        }
    }
}
