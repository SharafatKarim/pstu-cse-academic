// 6. We have to calculate the area of a rectangle, a square and a circle. Create an abstract class
// 'Shape' with three abstract methods namely 'RectangleArea' taking two parameters,
// 'SquareArea' and 'CircleArea' taking one parameter each. The parameters of
// 'RectangleArea' are its length and breadth, that of 'SquareArea' is its side and that of
// 'CircleArea' is its radius. Now create another class 'Area' containing all the three methods
// 'RectangleArea', 'SquareArea' and 'CircleArea' for printing the area of rectangle, square
// and circle respectively. Create an object of class 'Area' and call all the three methods.

abstract class Shape {
    abstract void RectangleArea(int length, int breadth);
    abstract void SquareArea(int side);
    abstract void CircleArea(int radius);
}

class Area extends Shape {
    @Override
    void RectangleArea(int length, int breadth) {
        System.out.println("Area of rectangle: " + length * breadth);
    }

    @Override
    void SquareArea(int side) {
        System.out.println("Area of square: " + side * side);
    }

    @Override
    void CircleArea(int radius) {
        System.out.println("Area of circle: " + 3.14 * radius * radius);
    }
}

public class Problem_6 {
    public static void main(String[] args) {
        Area a = new Area();
        a.RectangleArea(10, 20);
        a.SquareArea(10);
        a.CircleArea(10);
    }
}
