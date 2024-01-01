public class Problem_37 {
    public static void main(String[] args) {
        String str = "pickoutthelongestsubstring";
        String subString_without_repeating = "";

        for (int i = 0; i < str.length(); i++) {
            String tempString = "";
            for (int j = i; j < str.length(); j++) {
                if (tempString.indexOf(str.charAt(j)) == -1) {
                    tempString += str.charAt(j);
                } else {
                    break;
                }
            }
            if (tempString.length() > subString_without_repeating.length()) {
                subString_without_repeating = tempString;
            }
        }

        System.out.println(subString_without_repeating.length());
        System.out.println(subString_without_repeating);
    }
}
