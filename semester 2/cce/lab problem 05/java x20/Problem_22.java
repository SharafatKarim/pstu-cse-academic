public class Problem_22 {
    public static void main(String[] args) {
        int arr1[] = { 10, 10, 30, 40};
        int arr2[] = { 10, 10, 30, 45};

        int encounter = 0;
        for (int i=0; i< arr1.length-1; i++)
        {
            if (arr1[i] == 10 && arr1[i] == arr1[i+1])
                encounter++; 
        }
        for (int i=0; i< arr2.length-1; i++)
        {
            if (arr2[i] == 10 && arr2[i] == arr2[i+1])
                encounter++; 
        }
        if (encounter == 1)
            System.out.println(true);
        else
            System.out.println(false);
    }
}
