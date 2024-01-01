public class Problem_19 {
    public static void main(String[] args) {
        int[][] matrix = { {1, 2}, {3, 4}};
        int[][] matrix2 = { {1, 2}, {3, 4}};
        int[][] matrix_sum = new int[matrix.length][];

        for (int i = 0; i < matrix.length; i++) {
            matrix_sum[i] = new int[matrix[i].length];
            for (int j = 0; j < matrix[i].length; j++) {
                matrix_sum[i][j] = matrix[i][j] + matrix2[i][j];
            }
        }

        System.out.println("Matrix Sum:");
        for (int i = 0; i < matrix_sum.length; i++) {
            System.out.print("[");
            for (int j = 0; j < matrix_sum[i].length; j++) {
                System.out.print(matrix_sum[i][j]);
                if (j != matrix_sum[i].length - 1) {
                    System.out.print(", ");
                }
            }
            System.out.println("]");
        }
    }
}
