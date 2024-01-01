import java.nio.charset.Charset;

public class Problem_09 {
    public static void main(String[] args) {
        // System.out.println(Charset.availableCharsets());
        for (var i: Charset.availableCharsets().toString().split(","))
            System.out.println(i);
    }
}
