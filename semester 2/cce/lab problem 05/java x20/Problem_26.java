public class Problem_26 {
    public static void main(String[] args) {
        int arr1[] = { 10, 50, 60, 10, 30, 40};
        
        boolean lg = false;

        for (int i=0; i< arr1.length-2; i++)
        {
            if (arr1[i] == arr1[i+2] || arr1[i] == arr1[i+1])
                lg = true; 
        }
        
        System.out.println(lg);
    }
}
