public class Problem_31 {
    public static void main(String[] args) {
        String str = "   Hello World  ";
        String trimmed = "";

        int i, j;
        for (i = 0; str.charAt(i) == ' '; i++);
        for (j = str.length() - 1; str.charAt(j) == ' '; j--);

        for (int k = i; k <= j; k++) {
            trimmed += str.charAt(k);
        }

        System.out.println(trimmed);
    }
}
