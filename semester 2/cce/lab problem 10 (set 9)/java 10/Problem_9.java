public class Problem_9 {
    public static void main(String[] args) {
        int array[] = { 13, 15, 109, 200, 30, 14, 55 };
        int new_arr[] = new int[array.length + 1];

        int index = 1;
        int value_to_insert = 100;

        int j = 0;
        for (int i = 0; i < array.length; i++) {
            if (i == index) {
                new_arr[j++] = value_to_insert;
                new_arr[j++] = array[i];
            } else {
                new_arr[j++] = array[i];
            }
        }

        for (var i : new_arr) {
            System.out.println(i);
        }
    }
}
