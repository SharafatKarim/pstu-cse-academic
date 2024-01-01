import java.util.Scanner;

public class Problem_7 {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        System.out.print("String 1: ");
        String str1 = sc.nextLine();
        System.out.print("String 2: ");
        String str2 = sc.nextLine();
        sc.close();

        String concatenated_string;
        concatenated_string = str1 + str2;
        System.out.println("Concatenated string: " + concatenated_string);
    }
}
