public class Problem_12 {
    public static void main(String[] args) {
        int[] arr = { 13, 15, 109, 200, 15, 30, 14, 55, 13 };
        
        for (int i = 0; i < arr.length - 1; i++) {
            for (int j = i + 1; j < arr.length; j++ )
            {
                if (arr[i] == arr[j])
                    System.out.println("Duplicate: " + arr[i]);
            }
        }
    }
}
