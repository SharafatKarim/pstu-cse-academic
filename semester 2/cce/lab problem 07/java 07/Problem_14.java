import java.math.BigInteger;

public class Problem_14 {
    public static void main(String[] args) {
        BigInteger number = BigInteger.valueOf(Long.MAX_VALUE);
        System.out.println("BigInteger " + number);
        System.out.println("BigInteger to long " + number.longValue());
        System.out.println("BigInteger to integer " + number.intValue());
        System.out.println("BigInteger to short " + number.shortValue());
        System.out.println("BigInteger to double " + number.doubleValue());
        System.out.println("BigInteger to byte" + number.byteValue());
        System.out.println("BigInteger to float " + number.floatValue());
    }
}
