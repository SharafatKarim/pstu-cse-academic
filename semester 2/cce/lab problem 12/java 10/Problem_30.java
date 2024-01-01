public class Problem_30 {
    public static void main(String[] args) {
        String str = "Hello World";
        String uppercase = "";

        for (int i = 0; i < str.length(); i++) {
            if (str.charAt(i) >= 'a' && str.charAt(i) <= 'z') {
                uppercase += (char) (str.charAt(i) - 32);
            } else {
                uppercase += str.charAt(i);
            }
        }
        System.out.println(uppercase);
    }
}
