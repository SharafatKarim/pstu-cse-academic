public class Problem_25 {
    public static void main(String[] args) {
        String str = new String("Welcome to JavaTpoin");
        String str1 = new String("to");
        String str2 = new String("from");

        String replacedString = "";

        for (int i= 0; i < str.length()-1;i++)
        {
            if (str.charAt(i) == str1.charAt(0)) {
                for (int j = 0; j < str1.length(); j++) {
                    if (str.charAt(i + j) != str1.charAt(j)) {
                        replacedString += str.charAt(i);
                        break;
                    }
                    else {
                        replacedString += str2;
                        i += str1.length();
                    }
                }
            }
            else
            {
                replacedString += str.charAt(i);
            }
        }

        System.out.println(replacedString);
    }
}
