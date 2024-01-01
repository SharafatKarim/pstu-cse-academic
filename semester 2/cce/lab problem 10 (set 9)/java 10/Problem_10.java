import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

public class Problem_10 {
    public static void main(String[] args) {
        // ArrayList<Integer> arr = { 13, 15, 109, 200, 30, 14, 55 };
        ArrayList<Integer> arr = new ArrayList<Integer>();
        arr.addAll(List.of(13, 15, 109, 200, 30, 14, 55));

        Collections.max(arr);
        Collections.min(arr);

        System.out.println("Max: " + Collections.max(arr));
        System.out.println("Min: " + Collections.min(arr));
    }
}
