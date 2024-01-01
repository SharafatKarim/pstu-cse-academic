public class Problem_15 {
    public static void main(String[] args) {
        int[] arr = { 13, 15, 109, 200, 30, 14, 55 };
        int[] arr2 = { 12, 102, 14, 4, 3 };
        
        for (int i = 0; i < arr.length; i++) {
            for (int j = 0; j < arr2.length; j++ )
            {
                if (arr[i] == arr2[j])
                    System.out.println("Common: " + arr[i]);
            }
        }
    }
}
