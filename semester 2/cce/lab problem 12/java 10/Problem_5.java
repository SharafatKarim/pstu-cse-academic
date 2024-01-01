import java.util.Scanner;

public class Problem_5 {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        System.out.print("String 1: ");
        String str1 = sc.nextLine();
        System.out.print("String 2: ");
        String str2 = sc.nextLine();
        sc.close();

        // comapring
        int isSame = 0;
        for (int i = 0; i < str1.length(); i++) {
            if (str1.charAt(i) > str2.charAt(i)) {
                isSame = 1;
                break;
            }
            if (str1.charAt(i) < str2.charAt(i)) {
                isSame = -1;
                break;
            }
        }
        if (isSame == 0) {
            System.out.println("The strings are equal");
        } else if (isSame == 1) {
            System.out.println( str1 + " is greater than " + str2);
        } else {
            System.out.println( str2 + " is greater than " + str1);
        }
    }
}
