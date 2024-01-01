import java.util.Random;
import java.util.Scanner;

public class Problem_05 {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        int n = sc.nextInt();
        sc.close();

        Random rand = new Random();
        int day_num = rand.nextInt(7) + 1;
        
        System.out.println("Your number: " + n);    
        System.out.println("Day number: " + day_num);

        if (day_num == 1)
            System.out.println("Sunday");
        else if (day_num == 2)
            System.out.println("Monday");
        else if (day_num == 3)
            System.out.println("Tuesday");
        else if (day_num == 4)
            System.out.println("Wednesday");
        else if (day_num == 5)
            System.out.println("Thursday");
        else if (day_num == 6)
            System.out.println("Friday");
        else
            System.out.println("Saturday");
    }
}
