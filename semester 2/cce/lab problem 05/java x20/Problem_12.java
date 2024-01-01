import java.util.ArrayList;

public class Problem_12 {
    public static void main(String[] args) {
        int []arr = {1, 3, -5, 4};
        int []arr2 = {1, 4, -5, -2};
        
        ArrayList<Integer> arr3 = new ArrayList<Integer>();
        for (int i = 0; i < arr.length; i++)
        {
            arr3.add(arr[i] * arr2[i]);
        }
        for (var i: arr3)
        {
            System.out.println(i);
        }
     }
}
