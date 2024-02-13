public class BinarySearch {
    public static void main(String[] args) {
        int[] arr = { 1, 2, 3, 4, 5 };
        int x = 4;
        int result = search(arr, x);
        if (result == -1) {
            System.out.println("Element is not present in array");
        } else {
            System.out.println("Element is present at index " + result);
        }
    }

    public static int search(int[] arr, int x) {
        int length = arr.length;
        int first_pointer = 0;
        int last_pointer = length - 1;

        while (first_pointer <= last_pointer) {
            int middle_pointer = (last_pointer + first_pointer) / 2;
            if (arr[middle_pointer] == x) {
                return middle_pointer;
            } else if (arr[middle_pointer] > x) {
                last_pointer = middle_pointer - 1;
            } else {
                first_pointer = middle_pointer + 1;
            }
        }
        return -1;
    }
}
