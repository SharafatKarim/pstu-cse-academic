public class Problem_8 {
    public static void main(String[] args) {
        int arr[] = { 13, 15, 109, 200, 30, 14, 55 };
        int copy_arr[] = new int[arr.length];

        for (int i = 0; i < arr.length; i++) {
            copy_arr[i] = arr[i];
        }
        for (var i : copy_arr) {
            System.out.println(i);
        }
    }
}
