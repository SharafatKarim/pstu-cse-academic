public class Problem_17 {
    public static void main(String[] args) {
        int[] arr = { 500, 13, 15, 109, 200, 30, 14, 55 };
        int largest = arr[0];
        int second_largest = arr[0];

        for (int i = 1; i < arr.length; i++) {
            if (arr[i] > largest) {
                second_largest = largest;
                largest = arr[i];
            }
        }

        if (largest == second_largest) {
            second_largest = arr[1];
            for (int i = 1; i < arr.length; i++) {
                if (arr[i] > second_largest) {
                    second_largest = arr[i];
                }
            }
        }

        System.out.println("Second largest: " + second_largest);
    }
}
