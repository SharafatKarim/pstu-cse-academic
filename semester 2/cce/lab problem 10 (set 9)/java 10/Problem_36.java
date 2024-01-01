import java.util.Arrays;

public class Problem_36 {
    public static void main(String[] args) {
        int arr[] = {1, -2, 0, 5, -1, -4};
        Arrays.sort(arr);

        int sum = 2;
        for (int i = 0; i < arr.length; i++) {
            int value = arr[i];
            for (int j = i + 1; j < arr.length; j++) {
                for (int k = j + 1; k < arr.length; k++)
                {
                    if (value + arr[j] + arr[k] == sum) {
                        System.out.println("Found: " + value + " + " + arr[j] + " + " + arr[k] + " = " + sum);
                    }
                }
            }
        }
    }
}
