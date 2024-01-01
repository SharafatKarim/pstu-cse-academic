import java.util.Arrays;

public class Problem_23 {
    public static void main(String[] args) {
        int arr[] = { 13, 26, 15, 109, 200, 30, 14, 55, 1};
        int arr2[] = { 13, 26, 15, 109, 200, 30, 14, 55, 1};

        if (Arrays.equals(arr, arr2))
            System.out.println("Arrays are equal");
        else
            System.out.println("Arrays are not equal");
    }
}
