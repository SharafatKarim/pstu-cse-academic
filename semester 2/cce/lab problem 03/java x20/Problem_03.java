import java.util.Scanner;

public class Problem_03 {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        int a;
        System.out.print("Input the length: ");
        a = sc.nextInt();
        sc.close();

        // (6*s*s)/(4*tan(pi/6))
        int side = 6;
        double area = (6*a*a)/(4* Math.tan(Math.PI/side));
        System.out.println("Area is : "+ area);
    }
}
