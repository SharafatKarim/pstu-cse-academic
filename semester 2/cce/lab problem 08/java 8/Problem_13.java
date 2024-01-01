import java.util.Scanner;

public class Problem_13 {
    public static void main(String[] args) {
        Scanner scan = new Scanner(System.in);
        System.out.print("Enter your number: ");
        int num = scan.nextInt();
        scan.close();
        
        for (int i = 1; i <= num; i++) {
            System.out.println("The number is " + i + "and it's cube is " + i * i * i + ".");
        }
    }
}
