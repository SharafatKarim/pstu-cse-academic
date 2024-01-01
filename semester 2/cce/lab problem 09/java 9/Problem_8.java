import java.util.Scanner;

public class Problem_8 {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        System.out.print("Input the investment amount: ");
        double investment_amount = sc.nextDouble();
        System.out.print("Input the rate of interest: ");
        double rate_of_interest = sc.nextDouble();
        System.out.print("Input the number of years: ");
        int number_of_years = sc.nextInt();
        sc.close();

        System.out.println("Years    FutureValue");
        for (int i = 1; i <= number_of_years; i++) {
            System.out.printf("%-10d%.2f\n", i, investment_amount * Math.pow(1 + rate_of_interest / 100 / 12, i * 12));
        }
    }
}
