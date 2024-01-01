public class Problem_7 {
    public static void main(String[] args) {
        System.out.print("First 50 pentagonal numbers: ");
        for (int i = 1; i <= 50; i++) {
            System.out.print(i * (3 * i - 1) / 2 + " ");
        }
    }
}
