import java.util.Scanner;

public class Problem_19 {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        String n = sc.nextLine();
        char c = sc.next().charAt(0);
        sc.close();

        for (var i= 0; i < n.length(); i++)
        {
            if (n.charAt(i) == c)
            {
                System.out.println("Found at: " + i);
                return;
            }
        }

    }
}
