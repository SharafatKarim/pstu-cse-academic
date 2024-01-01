import java.util.Scanner;

public class Problem_26 {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        System.out.print("String : ");
        String str = sc.nextLine();
        System.out.print("String 2 : ");
        String sequence = sc.nextLine();
        sc.close();

        boolean found = true;
        for (int i = 0; i < sequence.length(); i++) {
            if (sequence.charAt(i) != str.charAt(i)) {
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
