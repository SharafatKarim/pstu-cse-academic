public class Problem_14 {
    public static void main(String[] args) {
        String s1 = "hello";
        Integer off = 3;

        StringBuffer stringBuffer = new StringBuffer();
        stringBuffer.append(s1.substring(off));
        stringBuffer.append(s1.substring(0, off));

        System.out.println(stringBuffer);
    }
}
