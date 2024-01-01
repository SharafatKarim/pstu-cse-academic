public class Problem_34 {
    public static final int totalchar = 256;

    public static void main(String[] args) {
        String str = "succsses";
        char res = secondFre(str);
        System.out.println(res);
    }

    public static char secondFre(String str) {
        int[] count = new int[totalchar];
        for (int i = 0; i < str.length(); i++) {
            ++(count[str.charAt(i)]);
        }
        int first = 0, second = 0;
        for (int i = 0; i < totalchar; i++) {
            if (count[i] > count[first]) {
                second = first;
                first = i;

            } else if (count[i] > count[second] && count[i] != count[first])
                second = i;
        }
        return (char) second;
    }
}