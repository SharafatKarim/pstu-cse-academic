import java.util.ArrayList;

public class Problem_23 {
    public static void main(String[] args) {
        int arr[] = {14, 12, 3, 15, 4, 9, 10};
        ArrayList<Integer> arr2 = new ArrayList<Integer>();
        
        for (var i: arr)
        {
            if (i%2 != 0)
                arr2.add(i);
        }
        
        for (var i: arr)
        {
            if (i%2 == 0)
                arr2.add(i);
        }

        for (var i: arr2)
            System.out.println(i);
    }
}
