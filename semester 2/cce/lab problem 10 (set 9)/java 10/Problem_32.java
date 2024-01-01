public class Problem_32 {
    public static void main(String[] args) {
        int[] arr = { 1, 2, 3, 4, 65, 77, 88, 99, 100, 101, 102, 103, 104, 105, 106, 107 };
        boolean contains_65 = false;
        boolean contains_77 = false;

        for (int i = 0; i < arr.length; i++) {
            if (arr[i] == 65) {
                contains_65 = true;
            }
            if (arr[i] == 77) {
                contains_77 = true;
            }
        }

        if (contains_65 && contains_77) {
            System.out.println("Array contains both 65 and 77");
        } else {
            System.out.println("Array does not contain both 65 and 77");
        }
    }
}
