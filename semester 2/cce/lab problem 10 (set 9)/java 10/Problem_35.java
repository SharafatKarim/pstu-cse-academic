public class Problem_35 {
    public static void main(String[] args) {
        int[] arr = {1,2,4,5,6};
        int sum = 6;

        for (int i = 0; i < arr.length; i++) {
            int value = arr[i];
            for (int j = i + 1; j < arr.length; j++) {
                if (value + arr[j] == sum) {
                    System.out.println("Found: " + value + " + " + arr[j] + " = " + sum);
                    break;
                }
            }
        }
    }
}
