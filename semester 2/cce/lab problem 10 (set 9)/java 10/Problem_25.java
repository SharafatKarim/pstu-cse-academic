public class Problem_25 {
    public static void main(String[] args) {
        int[] arr1 = { 1, 3, 5, 8, 10 };
        int[] arr2 = { 2, 5, 6, 8, 9 };
        int[] arr3 = { 1, 3, 5, 6, 8 };
        
        for (int i = 0; i < arr1.length; i++) {
            first: for (int j = 0; j < arr3.length; j++) {
                if (arr1[i] == arr3[j]) {
                    for (int k = 0; k < arr2.length; k++) {
                        if (arr1[i] == arr2[k]) {
                            System.out.println(arr1[i]);
                            break first;
                        }
                    }
                }
            }
        }
    }
}
