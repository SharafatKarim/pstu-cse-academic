public class Problem_25 {
    public static void main(String[] args) {
        int []arr = {14, 12, 3, 15, 4, 9, 10, 20, 10};

        boolean lg = false;
        for (int i = 0; i < arr.length; i++)
        {
            if (arr[i] == 10)
            {   
                for (int j = i+1; j < arr.length; j++)
                {
                    if (arr[j] == 20)
                    {
                        lg = true;
                        break;
                    }
                }
            }
        }
        System.out.println(lg);
    }
}
