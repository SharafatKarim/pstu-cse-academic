import java.util.Scanner;
public class Problem_15 {
    public static void main(String[] args) {
        Scanner scan = new Scanner(System.in);
        System.out.print("How many odd number: ");
        int num = scan.nextInt();
        scan.close();

        int count = 0;
        int sum = 0;
        
        for (int i = 1; count < num; i += 2) {
            System.out.println(i);
            sum += i;
            count++;
        }
        System.out.println("Sum of the first " + num + " odd numbers is " + sum);
    }
}
