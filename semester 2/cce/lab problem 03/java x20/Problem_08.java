public class Problem_08 {
    public static void main(String[] args) {
        int arr[] = {1, 2, 3, 4};
        int count = 0;

        for (int i = 0; i < arr.length; i++) {
            for (int j = 0; j < arr.length; j++) {
                for (int k = 0; k < arr.length; k++) {
                    if (arr[i] != arr[j] && arr[i] != arr[k] && arr[k] != arr[j])
                    {
                        System.out.println(arr[i]+""+arr[j]+""+arr[k]);
                        count++;
                    }
                }
            }
        }
        System.out.println("Total count: " + count);
    }
}
