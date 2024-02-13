public class SelectionSort {
    public static void main(String[] args) {
        int[] arr = { 1, 3, 3, 40, -5, 12, 2 };
        printArr(arr);
        sort(arr);
        printArr(arr);
    }

    public static void sort(int[] arr) {
        int length = arr.length;
        for (int i = 0; i < length - 1; i++) {
            int minimum = arr[i];
            int min_index = i;
            for (int j = i + 1; j < length; j++) {
                if (arr[j] < minimum) {
                    min_index = j;
                    minimum = arr[j];
                }
            }
            arr[min_index] = arr[i];
            arr[i] = minimum;
        }
    }

    public static void printArr(int[] arr) {
        for (int i : arr) {
            System.out.print(i + " ");
        }
        System.out.println();
    }

}
