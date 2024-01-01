import java.util.Scanner;

public class Problem_07 {
    public static void main(String[] args) {
        System.out.print("Input a number: ");
        Scanner in = new Scanner(System.in);
        int a = in.nextInt();
        in.close();
        
        for (int i = 1; i <= 10; i++) {
            System.out.println(a + " x " + i + " = " + a * i);
        }
    }
}
