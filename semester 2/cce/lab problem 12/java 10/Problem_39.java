public class Problem_39 {
    public static void main(String[] args) {
        String str = "gibblegabbler";
        char non_repeating_char = ' ';

        for (int i = 0; i < str.length(); i++) {
            boolean is_repeating = false;
            for (int j = 0; j < str.length(); j++) {
                if (i != j && str.charAt(i) == str.charAt(j)) {
                    is_repeating = true;
                    break;
                }
            }
            if (!is_repeating) {
                non_repeating_char = str.charAt(i);
                break;
            }
        }

        System.out.println(non_repeating_char);
    }
}
