public class Problem_16 {
    public static void main(String[] args) {
        for (int i = 2; i <= 100; i++) {
            if (is_prime(i)) {
                for (int j = i + 1; j <= i + 2; j++) {
                    if (is_prime(j)) {
                        System.out.println("(" + i + ", " + j + ")");
                    }
                }
            }
        }
    }

    public static boolean is_prime(int n) {
        for (int i = 2; i < n; i++) {
            if (n % i == 0)
                return false;
        }
        return true;
    }
}
