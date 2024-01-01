// 1. Create an abstract class 'Parent' with a method 'message'. It has two subclasses each
// having a method with the same name 'message' that prints "This is first subclass" and
// "This is second subclass" respectively. Call the methods 'message' by creating an object
// for each subclass.

abstract class Parent {
    abstract void message();
}

class First extends Parent {
    @Override
    void message() {
        System.out.println("This is First subclass");
    }
}

class Second extends Parent {
    @Override
    void message() {
        System.out.println("This is Second subclass");
    }
}

public class Problem_1 {
    public static void main(String[] args) {
        First first = new First();
        first.message();

        Second second = new Second();
        second.message();
    }
}
