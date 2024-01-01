public class Problem_48 {
    public static void main(String[] args) {
        String str = "thequickbrownfoxxofnworbquickthe";

        String tempString = "";
        for (int i = 0; i < str.length(); i++) {
            if (str.charAt(i) != 'b' || (str.charAt(i) != 'a' && str.charAt(i+1) != 'c')) {
                tempString += str.charAt(i);
            } else {
                break;
            }
        }

        System.out.println(tempString);
    }
}
