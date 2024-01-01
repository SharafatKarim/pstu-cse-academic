public class Problem_27 {
    public static void main(String[] args) {
        int arr1[] = { 10, 50, 20, 60, 20, 10, 30, 40, 20};
        
        int encounter = 0;

        for (int i=0; i< arr1.length-1; i++)
        {
            if ( arr1[i] == 20 && !(arr1[i] == arr1[i+1] || arr1[i] == arr1[i-1]))
                encounter++; 
        }

        if (arr1[arr1.length-1] == 20 && arr1[arr1.length-1] != arr1[arr1.length-2])
            encounter++;
        
        if (encounter == 3)
            System.out.println(true);
        else
            System.out.println(false);
    }
} 
