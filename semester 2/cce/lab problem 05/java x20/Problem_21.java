public class Problem_21 {
    public static void main(String[] args) {
        int even = 0;
        int odd = 0;
        int[] arr = { 5, 1, 6, 8 };

        for (var i: arr)
        {
            if (i % 2 == 0)
                even++;
            else
                odd++;
        }
        System.out.println("EVEN: " + even);
        System.out.println("ODD: " + odd);
    }
}
