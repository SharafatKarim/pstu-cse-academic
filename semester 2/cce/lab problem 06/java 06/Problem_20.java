public class Problem_20 {
    public static void main(String[] args) {
        int matrix[][] = new int[3][3];
        matrix = new int[][] { { 1, 2, 3 }, { 4, 5, 6 }, { 7, 8 } };
        int n = 3;

        for (var i = 0; i < n; i++) {
            for (var j = 0; j < matrix[i].length; j++) {
                if (matrix[i][j] == n) {
                    System.out.println("Found at: " + i + ", " + j);
                    return;
                }
            }
        }
    }
}
