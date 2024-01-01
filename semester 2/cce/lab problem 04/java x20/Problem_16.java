public class Problem_16 {
    public static void main(String[] args) {
        int n = 100;
        int c = 0;
        int s = 0;
        int i = 2;
        while (c < n) {
            if (isPrime(i)) {
                s += i;
                c++;
            }
            i++;
        }
        System.out.println(s);
    }

    public static boolean isPrime(int n) {
        boolean b = true;
        for (int i = 2; i <= Math.sqrt(n); i++) {
            if (n % i == 0)
                b = false;
        }
        return b;
    }

}
