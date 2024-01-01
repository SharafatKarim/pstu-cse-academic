public class Problem_37 {
    public static void main(String[] args) {
        int[][] matrix = {
                { 10, 20, 30 },
                { 50, 60, 70 },
                { 90, 100, 110 }
        };
        for (int i = 0; i < matrix.length; i++) {
            int k = 0;
            for (int j = i; j >= 0; j--) {
                System.out.print(matrix[j][k++] + " ");
            }
            System.out.println();
        }

        for (int i = 1; i < matrix.length; i++) {
            int k = i;
            for (int j = matrix.length - 1; j >= i; j--) {
                System.out.print(matrix[j][k++] + " ");
            }
            System.out.println();
        }
    }
}
