public class Problem_24 {
    public static void main(String[] args) {
        int arr[] = new int[] {  1, 4, 5, 8, 10 };
        int element = 9;

        int start = 0;
        int end = arr.length - 1;
        int mid = 0;

        while (start <= end)
        {
            mid = (start + end) / 2;
            if (arr[mid] == element)
            {
                break;
            }
            else if (arr[mid] < element)
            {
                start = mid + 1;
            }
            else
            {
                end = mid - 1;
            }
        }
        System.out.println("Element found at index " + mid);
    }
}
