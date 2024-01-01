import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

public class Problem_15 {
    public static void main(String[] args) {
        System.out.println(LocalDateTime.now().format(DateTimeFormatter.ISO_DATE_TIME));
    }
}