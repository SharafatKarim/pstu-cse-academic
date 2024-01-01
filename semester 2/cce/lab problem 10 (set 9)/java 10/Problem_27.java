public class Problem_27 {
    public static void main(String[] args) {
        int[] arr = { 1, 2, 0, 4, 5, 6, 0, 7, 8, 9, 0 };
        int even = 0;
        int odd = 0;
        
        for (int i = 0; i < arr.length; i++)
        {
            if (arr[i] % 2 == 0)
            {
                even++;
            }
            else
            {
                odd++;
            }
        }

        System.out.println("Even: " + even);
        System.out.println("Odd: " + odd);
    }
}
