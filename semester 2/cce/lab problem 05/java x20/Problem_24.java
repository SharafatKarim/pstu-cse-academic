import java.util.Arrays;

public class Problem_24 {
    public static void main(String[] args) {
        int n = 5;
        String arr[] = new String[5];

        for (int i = 0; i < n; i++ )
        {
            arr[i] = String.valueOf(i);
        }

        System.out.println(Arrays.toString(arr));
    }
}
