public class Problem_14 {
    public static void main(String[] args) {
        char[] arr = { 'a', 'b', 'c', 'd', 'e', 'f', 'a', 'g', 'h', 'i' };
        char[] arr2 = { 'e', 'z', 'x', 'y', 'b'};
        
        for (int i = 0; i < arr.length; i++) {
            for (int j = 0; j < arr2.length; j++ )
            {
                if (arr[i] == arr2[j])
                    System.out.println("Common: " + arr[i]);
            }
        }
    }
}
