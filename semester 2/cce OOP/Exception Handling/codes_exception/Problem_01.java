// 1.Write a java program using multiple catch blocks. Create a class CatchExercise inside the
// try block declare an array a[] and initialize with value a[5] =30/5; . In each catch block
// show Arithmetic exception and ArrayIndexOutOfBoundsException.
// Test Data:
// a[5] =30/5;
// Expected Output :
// ArrayIndexOutOfBoundsException occurs
// Rest of the code

public class Problem_01 {
    public static void main(String[] args) {
        try {
            int a[] = new int[5];
            a[5] = 30 / 5;
        } catch (ArithmeticException e) {
            System.out.println(e + " occurs");
        } catch (ArrayIndexOutOfBoundsException e) {
            System.out.println(e + " occurs");
        }
        System.out.println("Rest of the code");
    }
}
