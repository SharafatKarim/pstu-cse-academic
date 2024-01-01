import java.util.Scanner;

public class Problem_11 {

    public static void main(String[] args) {
        System.out.print("Enter an integer: ");
        Scanner sc = new Scanner(System.in);
        var n = sc.nextInt();
        sc.close();

        System.out.println("Value of " + n + " + " + n * 11 + " + " + n * 111 + " is: " + (n + n * 11 + n * 111));
    }
}