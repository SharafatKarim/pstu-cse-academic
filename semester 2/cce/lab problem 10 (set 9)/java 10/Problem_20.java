import java.util.ArrayList;
import java.util.Arrays;

public class Problem_20 {
    public static void main(String[] args) {
        Integer[] arr = { 13, 15, 109, 200, 30, 14, 55 };
        ArrayList<Integer> arrayl = new ArrayList<Integer>();
        
        arrayl.addAll(Arrays.asList(arr));

        System.out.println("Arraylist: ");
        System.out.println(arrayl.toString());
    }
}
