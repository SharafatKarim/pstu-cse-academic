public class Problem_40 {
    public static void main(String[] args) {
        int arr[] = {1, -2, 10, 5, -1, -4};
        int closest_to = Integer.MAX_VALUE;
        int closest1 = 0, closest2 = 0;
        for (int i = 0; i < arr.length-1; i++) 
        {
            for (int j = i + 1; j < arr.length; j++)
            {
                int value = arr[i] + arr[j];
                if (Math.abs(value) < closest_to)
                {
                    closest_to = Math.abs(value);
                    closest1 = arr[i];
                    closest2 = arr[j];
                }
            }
        }
        System.out.println("Closest to 0 is " + closest1 + " and " + closest2);
    }
}
