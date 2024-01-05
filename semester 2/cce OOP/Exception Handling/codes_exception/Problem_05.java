// 5. (Order of catch Blocks) Write a program that shows that the order of catch blocks is
// important. If you try to catch a superclass exception type before a subclass type, the
// compiler should generate errors.

public class Problem_05 {
    public static void main(String[] args) {
        try {
            int a = 50 / 0;
            System.out.println(a);
        } catch (Exception e) {
            System.out.println(e);
        }
        
        // catch (ArithmeticException e) {
        // System.out.println(e);
        // }

        // Uncommenting these 3 lines will cause compile time error
    }
}
