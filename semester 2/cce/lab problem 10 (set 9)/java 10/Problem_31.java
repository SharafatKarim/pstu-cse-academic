public class Problem_31 {
    public static void main(String[] args) {
        int[] arr = { 10, 2, 10, 4, 5, 6, 10, 7, 8, 9, 0 };
        int sum = 0;
        
        for (int i = 0; i < arr.length; i++)
        {
            if (arr[i] == 10)
            {
                sum += 10;
            }
        }

        System.out.println("Contains: " + (sum == 30));
    }
}
