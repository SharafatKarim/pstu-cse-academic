public class Problem_42 {
    public static void main(String[] args) {
        String str[] = {"abc", "xyz", "pqr", "abc", "xyz", "abc"};
        String str_to_look = "abc";

        int count[] = new int[str.length];
        for (int i = 0; i < str.length; i++) {
            if (str[i].equals(str_to_look)) {
                count[i]++;
            }
        }

        for (int i = 0; i < str.length; i++) {
            if (count[i] > 0) {
                System.out.println(str[i] + " " + count[i]);
            }
        }
    }
}
