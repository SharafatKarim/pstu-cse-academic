public class Problem_46 {
    public static void main(String[] args) {
        String str = "The quick brown fox jumps over the lazy dog.";
        String revString = reverseString(str);

        System.out.println(revString);
    }

    public static String reverseString(String str) {
        String revString = "";
        for (int i = str.length() - 1; i >= 0; i--) {
            revString += str.charAt(i);
        }
        return revString;
    }
}
