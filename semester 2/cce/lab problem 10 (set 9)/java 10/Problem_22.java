public class Problem_22 {
    public static void main(String[] args) {
        int arr[] = { 13, 26, 15, 109, 200, 30, 14, 55, 1};
        int sum = 27;

        for (int i = 0; i < arr.length - 1; i++) {
            for (int j = i + 1; j < arr.length; j++) {
                if (arr[i] + arr[j] == sum) {
                    System.out.println("Pair found at index " + i + " and " + j);
                }
            }
        }
    }
}
