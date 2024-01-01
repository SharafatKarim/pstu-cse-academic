public class Problem_30 {
    public static void main(String[] args) {
        int[] arr = { 1, 2, 0, 4, 5, 6, 0, 7, 8, 9, 0 };
        boolean contains = false;
        
        for (int i = 0; i < arr.length; i++)
        {
            if (arr[i] == 0 || arr[i] == -1)
            {
                contains = true;
                break;
            }
        }

        System.out.println("Contains: " + contains);
    }
}
