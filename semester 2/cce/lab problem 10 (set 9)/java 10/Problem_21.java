import java.util.ArrayList;
import java.util.Arrays;

public class Problem_21 {
    public static void main(String[] args) {
        ArrayList<Integer> arrayl = new ArrayList<Integer>();
        arrayl.add(1);
        arrayl.add(2);
        arrayl.add(3);
        arrayl.add(4);
        arrayl.add(5);

        Integer[] arr = arrayl.toArray(new Integer[arrayl.size()]);
        System.out.println("Array: ");
        System.out.println(Arrays.toString(arr));
    }
}
