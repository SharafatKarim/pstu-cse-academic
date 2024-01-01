public class Problem_29 {
    public static void main(String[] args) {
        int arr1[] = { 10, 10, 30, 40};
        int arr2[] = { 10, 10, 30, 45};

        int count = 0;
        for (int i=0; i< arr1.length; i++)
        {
            if (Math.abs(arr1[i] - arr2[i]) <= 1)
                count++;
        }
        System.out.println(count);
    }
}
