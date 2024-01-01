import java.lang.reflect.Array;
import java.util.ArrayList;

public class Problem_4 {
    public static void main(String[] args) {
        int ar[] = { 2, 6, 10, 25, 13, 20, 10, 5 };
        ArrayList <Integer>sar = new ArrayList<Integer>();
        boolean num = false;

        System.out.println(Array.getLength(ar));
        for (int i = 0; i < Array.getLength(ar); i++) {
            if (ar[i] == 10) {
                num = true;
            }
            if (num) {
                sar.add(ar[i]);
            }
        }

        System.out.println(sar.toString());
    }
}
