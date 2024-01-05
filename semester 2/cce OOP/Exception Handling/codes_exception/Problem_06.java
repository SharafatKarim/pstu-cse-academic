// 6. (Constructor Failure) Write a program that shows a constructor passing information
// about constructor failure to an exception handler. Define class SomeClass, which throws
// an Exception in the constructor. Your program should try to create an object of type
// SomeClass and catch the exception that’s thrown from the constructor.

class SomeClass {
    public SomeClass() throws Exception {
        throw new Exception("SomeClass constructor exception");
    }
}

public class Problem_06 {
    public static void main(String[] args) {
        try {
            SomeClass someClass = new SomeClass();
        } catch (Exception e) {
            System.out.println(e);
        }
    }
}
