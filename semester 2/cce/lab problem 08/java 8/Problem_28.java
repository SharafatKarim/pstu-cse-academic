import java.util.Scanner;

public class Problem_28 {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        float n = sc.nextFloat();
        sc.close();

        if (n > 0)
            System.out.println("Positive");
        else if (n < 0)
            System.out.println("Negative");
        else
            System.out.println("Zero");

        if (n < 1)
            System.out.println("Small");   
        else if (n > 1000000)
            System.out.println("Large");
    }
}
