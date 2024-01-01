import java.util.Arrays;

public class Problem_38 {
    public static void main(String[] args) {
        int[] arr = {1, 2, 1, 1, 3, 1};
        Arrays.sort(arr);
        int count_repeatation = 0;
        int element = 0;

        for (int i = 0; i < arr.length - 1; i++)
        {
            int value = arr[i];
            int repeatation = 1;
            for (int j = i + 1; j < arr.length; j++)
            {
                if (arr[j] == value)
                {
                    repeatation++;
                }
                else
                {
                    break;
                }
            }
            if (repeatation > count_repeatation)
            {
                count_repeatation = repeatation;
                element = value;
            }
        }

        if (count_repeatation > arr.length/2)
        {
            System.out.println("Majority element: " + element);
        }
        else
        {
            System.out.println("No majority element");
        }
    }
}
