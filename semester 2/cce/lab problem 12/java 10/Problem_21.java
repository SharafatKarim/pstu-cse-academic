public class Problem_21 {
    public static void main(String[] args) {
        String str = new String("Welcome to JavaTpoint");
        String str1 = new String("to");

        for (int i = 0; i < str.length()-str1.length(); i++) {
            if (str.charAt(i) == str1.charAt(0)) {
                for (int j = 0; j < str1.length(); j++) {
                    if (str.charAt(i + j) != str1.charAt(j)) {
                        break;
                    }
                    if (j == str1.length() - 1) {
                        System.out.println("Found at index " + i);
                    }
                }
            }
        }
    }
}
