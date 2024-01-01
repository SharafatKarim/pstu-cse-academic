public class Problem_22 {
    public static void main(String[] args) {
        int[] arr = new int[] { -2, 1, -3, 4, -1, 2, 1, -5, 4 };
        
        int max = arr[0];
        int sum = 0;

        int start = 0;
        int end = 0;

        for (var i=0; i< arr.length; i++)
        {
            sum += arr[i];
            if (sum > max)
            {
                max = sum;
                end = i;
            }
            if (sum < 0)
            {
                sum = 0;
                start = i + 1;
            }
        }
        
        for (var i = start; i <= end; i++)
        {
            System.out.print(arr[i] + " ");
        }
    }
}
