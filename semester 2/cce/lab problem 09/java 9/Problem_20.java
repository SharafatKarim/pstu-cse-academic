import java.util.Scanner;

public class Problem_20 {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        System.out.print("Input the number: ");
        int n = sc.nextInt();
        sc.close();
        
        System.out.println("The first digit is " + first_digit(n));
    }

    public static int first_digit(int n) {
        while (n > 10) {
            n /= 10;
        }
        return n;
    }
}
