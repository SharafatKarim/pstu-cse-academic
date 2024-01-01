// 1. Write a console based program to implement polymorphism using inheritance. Consider the example
// of Shape as base class with method show(). And then a child class Circle and Rectangle which inherit the
// base class Shape and override its method show(). Add one more Method with the name of getInfo().
// This method would display the class name in which it is implemented. Do not override this method.
// When you will call the method getInfo() with child object it would still show the name of the base class,
// which implies that method has been directly inherited and was not overridden.

class Shape 
{
    void show()
    {
        System.out.println("This is shape class's show");
    }
    
    void getInfo()
    {
        System.out.println("This is shape class's getInfo");
    }
}

class Circle extends Shape
{
    @Override
    void show()
    {
        System.out.println("This is circle class's show");
    }
}

class Rectangle extends Shape
{
    @Override
    void show()
    {
        System.out.println("This is rectangle class's show");
    }
}

public class One
{
    public static void main(String[] args) {
        Shape s = new Shape();
        s.show();
        s.getInfo();

        Circle c = new Circle();
        c.show();
        c.getInfo();

        Rectangle r = new Rectangle();
        r.show();
        r.getInfo();
    }
}