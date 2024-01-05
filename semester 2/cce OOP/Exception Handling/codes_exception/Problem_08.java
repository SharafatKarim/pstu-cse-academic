// 8. (Catching Exceptions Using Outer Scopes) Write a program showing that a method with
// its own try block does not have to catch every possible error generated within the try.
// Some exceptions can slip through to, and be handled in, other scopes.

public class Problem_08 {
    static void another_method() {
        try {
            System.out.println(1 / 0);
        } catch (ArrayIndexOutOfBoundsException e) {
            System.out.println(e + " - Array Index");
        }
    }

    public static void main(String[] args) {
        try {
            try {
                another_method();
            } catch (ArithmeticException e) {
                System.out.println(e + " - Arithmetic");
            }
        } catch (Exception e) {
            System.out.println(e + " - General");
        }
    }
}
