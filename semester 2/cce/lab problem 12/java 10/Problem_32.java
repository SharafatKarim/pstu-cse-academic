public class Problem_32 {
    public static void main(String[] args) {
        String str = "thequickbrownfoxxofnworbquickthe";
        String pallindrome = "";
        String tempString = "";

        for (int i = 0; i < str.length(); i++) {
            tempString = "";
            for (int j= str.length(); j > i; j--) {
                tempString = str.substring(i, j);
                if (tempString.equals(new StringBuilder(tempString).reverse().toString())) {
                    if (tempString.length() > pallindrome.length()) {
                        pallindrome = tempString;
                    }
                }
            }
        }

        System.out.println(pallindrome);
    }
}
