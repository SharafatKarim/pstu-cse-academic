import java.util.LinkedList;
import java.util.Scanner;

public class Problem_10 {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        int number = scanner.nextInt();
        scanner.close();
        LinkedList<Integer> list = new LinkedList<>();

        while (number > 0) {
            list.add(number % 10);
            number /= 10;
        }

        for (int i = list.size() - 1; i >= 0; i--) {
            System.out.print(list.get(i) + " ");
        }
    }
}
