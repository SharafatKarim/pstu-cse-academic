import java.util.Scanner;

public class Problem_07 {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        System.out.print("Enter the year: ");
        int year = sc.nextInt();
        System.out.print("Enter the month: ");
        int month = sc.nextInt();
        sc.close();
        
        if (month == 2) {
            if (year % 4 == 0)
                System.out.println("29 days");
            else
                System.out.println("28 days");
        } else if (month == 4 || month == 6 || month == 9 || month == 11)
            System.out.println("30 days");
        else
            System.out.println("31 days");
    }
}
