import java.util.Scanner;

public class Problem_05 {
    public static void main(String[] args) {
        double x1, y1, x2, y2;
        var radius = 6371.01;
        Scanner in = new Scanner(System.in);
        System.out.print("Input the latitude of coordinate 1: ");
        x1 = in.nextDouble();
        System.out.print("Input the longitude of coordinate 1: ");
        y1 = in.nextDouble();   
        System.out.print("Input the latitude of coordinate 2: ");
        x2 = in.nextDouble();
        System.out.print("Input the longitude of coordinate 2: ");
        y2 = in.nextDouble();   
        in.close();

        x1 = Math.toRadians(x1);
        x2 = Math.toRadians(x2);
        y1 = Math.toRadians(y1);
        y2 = Math.toRadians(y2);

        var distance = radius * Math.acos(Math.sin(x1)*Math.sin(x2)+Math.cos(x1)*Math.cos(x2)*Math.cos(y1-y2));
        System.out.println("Distance is: " + distance);
    }
}
