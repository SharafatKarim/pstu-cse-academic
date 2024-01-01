public class Problem_28 {
    public static void main(String[] args) {
        String str = "Hello World";
        char[] sequence = new char[str.length()];

        for (int i = 0; i < sequence.length; i++) {
            sequence[i] = str.charAt(i);
        }
        System.out.println(sequence);
    }
}
