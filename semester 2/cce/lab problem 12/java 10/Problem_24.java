public class Problem_24 {
    public static void main(String[] args) {
        String str1 = "The quick brown fox jumps over the lazy dog";
        char ch = 'f';
        int index_to_replace = 40;

        String str2 = "";
        for (int i = 0; i < str1.length(); i++) {
            if (i == index_to_replace)
                str2 += ch;
            else
                str2 += str1.charAt(i);
        }

        System.out.println(str2);
    }
}
