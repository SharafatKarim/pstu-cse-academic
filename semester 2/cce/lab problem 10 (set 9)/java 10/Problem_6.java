public class Problem_6 {
    public static void main(String[] args) {
        int arr[] = { 15, 15, 109, 200, 30, 14, 55 };
        int value_to_find = 200;
        int index = -1;

        for (int i = 0; i < arr.length; i++) {
            if (arr[i] == value_to_find) {
                index = i;
                break;
            }
        }

        if (index != -1) {
            System.out.println("Value found at index: " + index);
        } else {
            System.out.println("Value not found in the array");
        }
    }
}
