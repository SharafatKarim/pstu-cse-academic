public class Problem_18 {
    public static void main(String[] args) {
        int[] arr = { 500, 13, 15, 109, 200, 30, 14, 55 };
        int smallest = arr[0];
        int second_smallest = arr[0];

        for (int i = 1; i < arr.length; i++) {
            if (arr[i] < smallest) {
                second_smallest = smallest;
                smallest = arr[i];
            }
        }

        if (smallest == second_smallest) {
            second_smallest = arr[1];
            for (int i = 1; i < arr.length; i++) {
                if (arr[i] < second_smallest) {
                    second_smallest = arr[i];
                }
            }
        }

        System.out.println("Second smallest: " + second_smallest);
    }
}
