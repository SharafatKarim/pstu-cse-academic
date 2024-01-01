public class Problem_33 {
    public static void main(String[] args) {
        int arr[] = { 20, 20, 30, 40, 50, 50, 50 };
        int n = arr.length;

        int Duplicate = 0;
        for (int i = 0; i < n; i++) {
            for (int j = i + 1; j <= n - 1; j++) {
                if (arr[i] == arr[j]) {
                    Duplicate++;
                }
            }
        }

        System.out.println("Duplicate elements numbers are: " + Duplicate);
    }
}
