public class Problem_11 {
    public static void main(String[] args) {
        int []arr = {20, 30, 40};
        
        int larger = arr[0];
        for (var i: arr)
        {
            if (i > larger)
                larger = i;
        }
        
        System.out.println("Larger value : " + larger);
    }
}
