import java.util.Scanner;

public class Problem_12 {
    public static void main(String[] args) {
        Scanner scan = new Scanner(System.in);
        System.out.print("Enter five numbers: ");
        int[] numbers = new int[5];
        for (int i = 0; i < 5; i++) {
            numbers[i] = scan.nextInt();
        }
        scan.close();
        
        int sum = 0;
        for (int i = 0; i < 5; i++) {
            System.out.println(numbers[i]);
            sum += numbers[i];
        }
        System.out.println("Sum of the numbers is " + sum);
    }
}
