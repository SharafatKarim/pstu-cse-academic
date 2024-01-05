// 2. Create a program to ask the user for a real number and display its square root. Errors
// must be trapped using "try..catch".

import java.util.Scanner;

public class Problem_02 {
    public static void main(String[] args) {
        float real_num;
        System.out.print("Enter a real number: ");

        Scanner scanner = new Scanner(System.in);
        real_num = scanner.nextFloat();
        scanner.close();

        try {
            if (real_num < 0)
                throw new IllegalArgumentException("The number must not be negative");
            System.out.println("Square root is " + Math.sqrt(real_num));
        } catch (IllegalArgumentException e) {
            System.out.println(e);
        } catch (Exception e) {
            System.out.println(e);
        }

        System.out.println("rest of the code...");
    }
}
