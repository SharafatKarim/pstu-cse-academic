public class Problem_16 {
    public static void main(String[] args) {
        int[] arr = { 13, 15, 109, 200, 30, 13, 14, 30, 55 };
        int[] without_duplicates = new int[arr.length];

        int without_duplicates_index = 0;
        for (int i = 0; i < arr.length; i++) {
            boolean duplicate = false;
            for (int j = 0; j < without_duplicates_index; j++) {
                if (arr[i] == without_duplicates[j]) {
                    duplicate = true;
                    break;
                }
            }
            if (!duplicate) {
                without_duplicates[without_duplicates_index] = arr[i];
                without_duplicates_index++;
            }
        }

        System.out.println("Original:");
        for (int i = 0; i < arr.length; i++) {
            System.out.println("arr[" + i + "]: " + arr[i]);
        }

        System.out.println("Without duplicates:");
        for (int i = 0; i < without_duplicates_index; i++) {
            System.out.println("without_duplicates[" + i + "]: " + without_duplicates[i]);
        }
    }
}
