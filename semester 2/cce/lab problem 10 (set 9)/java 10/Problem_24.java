public class Problem_24 {
    public static void main(String[] args) {
        int[] arr = { 1, 2, 4, 5, 6, 7, 8, 9, 0 };
        int[] arr2 = { 1, 2, 3, 4, 5, 6, 7, 8, 9, 0 };

        for (int i =0; i < arr2.length; i++)
        {
            for (int j = 0; j < arr.length; j++)
            {
                if (arr2[i] == arr[j])
                {
                    arr2[i] = -1;
                    break;
                }
            }
        }

        System.out.println("Missing elements: ");
        for (int i = 0; i < arr2.length; i++)
        {
            if (arr2[i] != -1)
            {
                System.out.print(arr2[i] + " ");
            }
        }
    }
}
