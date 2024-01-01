import java.util.ArrayList;
import java.util.Collections;

public class Problem_13 {
    public static void main(String[] args) {
        int arr1[] = { 1, 6, 8, 24 };
        int arr2[] = { 2, 3, 5, 8, 24 };

        ArrayList<Integer> arrayList = new ArrayList<>();

        for (var i : arr1)
            arrayList.add(i);
        for (var i : arr2)
            arrayList.add(i);

        Collections.sort(arrayList);
        System.out.println(arrayList.toString());
    }
}
