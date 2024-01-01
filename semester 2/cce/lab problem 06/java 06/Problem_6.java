import java.lang.reflect.Array;
import java.util.ArrayList;

public class Problem_6 {
    public static void main(String[] args) {
        int ar[] = { 2, 6, 10, 25, 13, 20, 10, 5 , 2, 6};
        
        ArrayList <Integer>ar2 = new ArrayList<Integer>();
        for (int i = 1; i < Array.getLength(ar); i++)
        {
            ar2.add(ar[i]);
        }
        ar2.add(ar[0]);

        System.out.println(ar2.toString());
    }
}
