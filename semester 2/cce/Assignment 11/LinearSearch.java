/**
 * LinearSearch
 */
public class LinearSearch {

    public static void main(String[] args) {
        int[] arr = { 1, 2, 3, 4, 5 };
        int x = 3;
        int result = search(arr, x);
        if (result == -1) {
            System.out.println("Element is not present in array");
        } else {
            System.out.println("Element is present at index " + result);
        }
    }

    public static int search(int[] arr, int x) {
        for (int i = 0; i < arr.length; i++) {
            if (arr[i] == x) {
                return i;
            }
        }
        return -1;
    }
}