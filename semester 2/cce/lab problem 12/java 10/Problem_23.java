public class Problem_23 {
    public static void main(String[] args) {
        String str1 = "Shanghai Houston Colorado Alexandria";
        String str2 = "Alexandria Colorado Houston Shanghai";

        boolean match1 = true;
        for (int i = 0; i < 8; i++) {
            if (str1.charAt(i) != str2.charAt(28 + i)) {
                match1 = false;
                break;
            }
        }

        System.out.println("str1[0 - 7] == str2[28 - 35]? " + match1);
    }
}
