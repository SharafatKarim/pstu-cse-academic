public class Problem_10 {
    public static void main(String[] args) {
        int []arr = {20, 30, 40};
        
        var temp = arr[0];
        arr[0] = arr[arr.length-1];
        arr[arr.length-1] = temp; 

        for (var i: arr)
            System.out.println(i);        
    }
}
