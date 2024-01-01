public class Problem_09 {
    public static void main(String[] args) {
        int []arr = {20, 30, 40};
        
        int larger;
        if (arr[0] > arr[arr.length-1])
            larger = arr[0];
        else 
            larger = arr[arr.length-1];
        
        System.out.println("Larger value between first and last element: " + larger);
    }
}
