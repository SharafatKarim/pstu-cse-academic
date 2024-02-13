public class InsertionSort {
    public static void main(String[] args) {
        int[] arr = { 1, 3, 3, 40, -5, 12, 2 };
        printArr(arr);
        sort(arr);
        printArr(arr);
    }

    public static void sort(int[] arr) {
        int length = arr.length;
        for (int i = 1; i < length; i++) {
            for (int j=i; j > 0 && arr[j-1]>arr[j] ;j--) {
                int temp = arr[j];
                arr[j] = arr[j-1];
                arr[j-1] = temp;
            }
        }
    }

    public static void printArr(int[] arr) {
        for (int i : arr) {
            System.out.print(i + " ");
        }
        System.out.println();
    }

}
