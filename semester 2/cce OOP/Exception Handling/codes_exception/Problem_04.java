// 4. (Catching Exceptions Using Class Exception) Write a program that demonstrates how
// various exceptions are caught with catch (Exception exception ) This time, define classes
// ExceptionA (which inherits from class Exception) and ExceptionB (which inherits from
// class ExceptionA). In your program, create try blocks that throw exceptions of types
// ExceptionA, ExceptionB, NullPointerException and IOException. All exceptions should
// be caught with catch blocks specifying type Exception.

import java.io.IOException;

class ExceptionA extends Exception {
    public ExceptionA(String message) {
        super(message);
    }
}

class ExceptionB extends ExceptionA {
    public ExceptionB(String message) {
        super(message);
    }
}

public class Problem_04 {
    public static void main(String[] args) {
        try {
            throw new ExceptionA("Exception type A");
        } catch (Exception exception) {
            System.out.println(exception);
        }

        try {
            throw new ExceptionB("Exception type B");
        } catch (Exception exception) {
            System.out.println(exception);
        }

        try {
            throw new NullPointerException("Null pointer exception");
        } catch (Exception exception) {
            System.out.println(exception);
        }

        try {
            throw new IOException("IO Exception");
        } catch (Exception exception) {
            System.out.println(exception);
        }
    }
}
