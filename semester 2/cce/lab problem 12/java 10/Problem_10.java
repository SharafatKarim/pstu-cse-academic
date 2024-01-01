import java.util.Scanner;

public class Problem_10 {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        System.out.print("String : ");
        String str = sc.nextLine();
        System.out.print("String 2 : ");
        String sequence = sc.nextLine();
        sc.close();

        boolean found = false;
        for (int i = 0; i < str.length(); i++) {
            if (str.charAt(i) == sequence.charAt(0)) {
                for (int j = 0; j < sequence.length(); j++) {
                    if (str.charAt(i + j) != sequence.charAt(j)) {
                        break;
                    }
                    if (j == sequence.length() - 1) {
                        found = true;
                    }
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
