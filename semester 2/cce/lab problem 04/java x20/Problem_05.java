import java.util.Scanner;

public class Problem_05 {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        int a;
        System.out.print("Input the seconds: ");
        a = sc.nextInt();
        sc.close();

        int H, M;
        H = a / 3600;
        a = a % 3600;
        M = a / 60;
        a = a % 60;    
        
        System.out.printf("%2d:%2d:%2d", H, M, a);
    }
}
