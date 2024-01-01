import java.util.Scanner;

public class Problem_05 {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        int time_offset = scanner.nextInt();
        scanner.close();
        
        float milliseconds = System.currentTimeMillis();
        float seconds = milliseconds / 1000;
        float minutes = seconds / 60;
        float hours = minutes / 60;

        System.out.println("Current time is " + (int) (hours + time_offset) % 24 + ":" + (int) minutes % 60 + ":" + (int) seconds % 60);
    }
}
