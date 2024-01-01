import java.util.Scanner;

public class Problem_17 {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        System.out.print("Input the number: ");
        int a = sc.nextInt();
        sc.close();

        int num_two = 0;
        while (a > 0) {
            if (a % 2 == 0) {
                num_two++;
            }
            a /= 10;
        }

        System.out.println("The number of 2s is " + num_two);
    }
}
