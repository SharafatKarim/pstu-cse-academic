import java.util.Scanner;

public class Problem_06 {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        System.out.print("Enter a floating point number: ");
        float m = sc.nextFloat();
        System.out.print("Enter an another floating point number: ");
        float n = sc.nextFloat();
        sc.close();

        if ((int)(m*1000) == (int)(n*1000))
            System.out.println("They are the same up to two decimal places");
        else
            System.out.println("They are different");
    }
}
