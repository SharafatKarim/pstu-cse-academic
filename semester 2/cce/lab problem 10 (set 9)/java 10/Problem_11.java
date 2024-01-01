public class Problem_11 {
    public static void main(String[] args) {
        int[] arr = { 13, 15, 109, 200, 30, 14, 55 };
        int[] reversed = new int[arr.length];

        for (int i = 0; i < arr.length; i++) {
            reversed[i] = arr[arr.length - i - 1];
        }

        System.out.println("Original:");
        for (int i = 0; i < arr.length; i++) {
            System.out.println("arr[" + i + "]: " + arr[i]);
        }

        System.out.println("Reversed:");
        for (int i = 0; i < reversed.length; i++) {
            System.out.println("reversed[" + i + "]: " + reversed[i]);
        }
    }
}
