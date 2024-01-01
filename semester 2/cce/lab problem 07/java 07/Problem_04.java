import java.util.Scanner;

public class Problem_04 {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        double minutes = scanner.nextDouble();
        scanner.close();

        double years = (long) minutes / 525600;
        double days = (long) (minutes % 525600) / 1440;

        System.out.printf("%.0f minutes is approximately %.0f years and %.0f days", minutes, years, days);
    }
}
