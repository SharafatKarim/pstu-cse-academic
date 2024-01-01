import java.util.Scanner;

public class Problem_14 {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        System.out.print("Input the number of sides: ");
        int n = scanner.nextInt();
        System.out.print("Input the side: ");
        float s = scanner.nextFloat();
        scanner.close();

        System.out.println("The area of the pentagon is " + area_of_penatgon(n, s));
    }

    static float area_of_penatgon(int n, float s) {
        return (float) (n * Math.pow(s, 2) / (4 * Math.tan(Math.PI / n)));
    }
}
