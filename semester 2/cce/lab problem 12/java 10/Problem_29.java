public class Problem_29 {
    public static void main(String[] args) {
        String str = "Hello World";
        String lowercase = "";

        for (int i = 0; i < str.length(); i++) {
            if (str.charAt(i) >= 'A' && str.charAt(i) <= 'Z') {
                lowercase += (char) (str.charAt(i) + 32);
            } else {
                lowercase += str.charAt(i);
            }
        }
        System.out.println(lowercase);
    }
}
