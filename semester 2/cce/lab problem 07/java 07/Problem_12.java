import java.util.Scanner;

public class Problem_12 {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        Integer first_number = scanner.nextInt();
        Integer second_number = scanner.nextInt();
        scanner.close();

        System.out.println(Integer.compare(first_number, second_number));
        System.out.println(Integer.compareUnsigned(first_number, second_number));
    }
}