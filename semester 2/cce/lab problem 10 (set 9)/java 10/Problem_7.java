public class Problem_7 {
    public static void main(String[] args) {
        Integer arr[] = { 13, 15, 109, 200, 30, 14, 55 };
        int what_to_remove = 15;

        int new_arr[] = new int[arr.length - 1];
        int new_arr_index = 0;

        for (int i = 0; i < arr.length; i++) {
            if (arr[i] != what_to_remove) {
                new_arr[new_arr_index] = arr[i];
                new_arr_index++;
            }
        }

        for (var i : new_arr) {
            System.out.println(i);
        }
    }
}
