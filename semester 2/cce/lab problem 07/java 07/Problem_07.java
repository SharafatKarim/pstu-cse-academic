import java.util.Scanner;

public class Problem_07 {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        int distance_meter = scanner.nextInt();
        int hour = scanner.nextInt();
        int minute = scanner.nextInt();
        int second = scanner.nextInt();
        scanner.close();

        float total_seconds = (hour * 3600) + (minute * 60) + second;
        float total_hours = total_seconds / 3600;

        float meter_per_second = distance_meter / total_seconds;
        float kilometer_per_hour = (distance_meter / 1000.0f) / total_hours;
        float mile_per_hour = (distance_meter / 1609.0f) / total_hours;

        System.out.println("Your speed in meters/second is " + meter_per_second);
        System.out.println("Your speed in km/h is " + kilometer_per_hour);
        System.out.println("Your speed in miles/h is " + mile_per_hour);
    }
}
