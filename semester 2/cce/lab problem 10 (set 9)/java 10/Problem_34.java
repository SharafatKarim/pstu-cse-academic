import java.util.Arrays;

public class Problem_34 {
    public static void main(String[] args) {
        int[] arr = { 49, 1, 3, 200, 2, 4, 70, 5 };
        Arrays.sort(arr);

        int continous = 0, maxContinous = 0;
        for (int i = 0; i < arr.length - 1; i++)
        {
            int value = arr[i];
            continous = 1;
            for (int j = i + 1; j < arr.length; j++)
            {
                if (arr[j] == value + 1 )
                {
                    continous++;
                    value = arr[j];
                }
                else
                {
                    break;
                }
            }
            if (continous > maxContinous)
            {
                maxContinous = continous;
            }
        }

        System.out.println("Maximum number of consecutive elements: " + maxContinous);
    }
}
