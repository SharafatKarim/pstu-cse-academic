import java.util.Scanner;

public class Problem_04 {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        int a;
        int side;
        System.out.print("Input the length: ");
        a = sc.nextInt();
        System.out.print("Input the side  : ");
        side = sc.nextInt();
        sc.close();

        // (6*s*s)/(4*tan(pi/6))
        double area = (side*a*a)/(4* Math.tan(Math.PI/side));
        System.out.println("Area is : "+ area);
    }
}
