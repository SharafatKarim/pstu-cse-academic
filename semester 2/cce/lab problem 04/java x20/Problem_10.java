import java.util.Scanner;

public class Problem_10 {
    public static void main(String[] args) {
        System.out.print("Input a string: ");
        Scanner in = new Scanner(System.in);
        var a = in.nextLine();
        in.close();

        String L[] = a.split(" ");   
        int l = L.length;
        System.out.println(L[l-2]);
    }
}
