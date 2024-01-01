public class Problem_27 {
    public static void main(String[] args) {
        String str = "Hello World";
        int start = 6;
        int end = 11;
        String sequence = "";

        for (int i = start; i < end; i++) {
            sequence += str.charAt(i);
        }
        System.out.println(sequence);
    }
}
