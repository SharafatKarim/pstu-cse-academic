import java.util.Scanner;

public class Problem_11 {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        int a = scanner.nextInt();
        int b = scanner.nextInt();
        scanner.close();

        int sum = 0;
        while (a-- > 0)
            sum++;
        while (b-- > 0)
            sum++;
        
        System.out.println(sum);
    }
}
