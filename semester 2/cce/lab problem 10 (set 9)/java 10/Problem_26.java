public class Problem_26 {
    public static void main(String[] args) {
        int[] arr = { 1, 2, 0, 4, 5, 6, 0, 7, 8, 9, 0 };
        int[] arr2 = new int[arr.length];

        int j = 0;
        for (int i = 0; i < arr.length; i++)
        {
            if (arr[i] != 0)
            {
                arr2[j++] = arr[i];
            }
        }
        while (j<arr.length)
        {
            arr2[j++] = 0;
        }

        System.out.println("Array: ");
        for (int i = 0; i < arr2.length; i++)
        {
            System.out.print(arr2[i] + " ");
        }
    }
}
