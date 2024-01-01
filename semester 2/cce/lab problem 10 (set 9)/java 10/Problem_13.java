public class Problem_13 {
    public static void main(String[] args) {
        char[] arr = { 'a', 'b', 'c', 'd', 'e', 'f', 'a', 'g', 'h', 'i' };
        
        for (int i = 0; i < arr.length - 1; i++) {
            for (int j = i + 1; j < arr.length; j++ )
            {
                if (arr[i] == arr[j])
                    System.out.println("Duplicate: " + arr[i]);
            }
        }
    }
}
