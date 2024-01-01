import java.util.Scanner;

public class Problem_17 {
    public static void main(String[] args) {
        System.out.print("Input the number: ");
        Scanner in = new Scanner(System.in);
        var n = in.nextInt();
        in.close();

        if (n%2 == 0)
            System.out.println("1");
        else
            System.out.println("0");
    }
}
