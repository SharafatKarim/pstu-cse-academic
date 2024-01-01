import java.util.Scanner;

public class Problem_13 {
    public static void main(String[] args) {
        double width, height;
        Scanner in = new Scanner(System.in);
        System.out.print("Input width: ");
        width = in.nextDouble();
        System.out.print("Input height: ");
        height = in.nextDouble();
        in.close();

        System.out.println("Area is " + (width * height));
        System.out.println("Perimeter is " + (2 * width + 2 * height));
    }
}
