public class Problem_28 {
    public static void main(String[] args) {
        int[] arr = { 1, 2, 0, 4, 5, 6, 0, 7, 8, 9, 0 };
        int largest = arr[0];
        int smallest = arr[0];

        for (int i = 0; i < arr.length; i++)
        {
            if (arr[i] > largest)
            {
                largest = arr[i];
            }
            if (arr[i] < smallest)
            {
                smallest = arr[i];
            }
        }

        System.out.println("Difference: " + (largest - smallest));
    }
}
