import java.util.Scanner;
public class Problem_02 {

    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        Double inches = sc.nextDouble();
        sc.close();

        System.out.printf("Meter: %.2f m\n", (inches * 0.0254));
    }
}