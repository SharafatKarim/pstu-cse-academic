import java.util.Scanner;

public class Problem_32 {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        float a = sc.nextFloat();
        float b = sc.nextFloat();
        sc.close();

        if ( (int)(a*100) == (int)(b*100) )
            System.out.println("They are the same up to two decimal places");
        else
            System.out.println("They are different");
    }
}
