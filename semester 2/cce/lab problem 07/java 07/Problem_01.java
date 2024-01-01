import java.util.Scanner;
public class Problem_01 {

    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        Double fahrenheit = sc.nextDouble();
        sc.close();

        System.out.println("Celsius: " + ((fahrenheit - 32) * 5 / 9) + "°C");
    }
}