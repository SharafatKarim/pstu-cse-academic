public class Problem_40 {
    public static void main(String[] args) {
        String str = "abcdefghijklmnopqrstuvwxy";
        int length = str.length();
        int parts = length / 5;

        for (int i = 0; i < parts; i++) {
            System.out.println(str.substring(i * 5, (i + 1) * 5));
        }
    }
}
