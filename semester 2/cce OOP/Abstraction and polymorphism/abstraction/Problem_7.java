// 7. Repeat the above question for 4 rectangles, 4 squares and 5 circles.
// Hint- Use array of objects.

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

public class Problem_7 {
    public static void main(String[] args) {

        Area[] rectangle = new Area[4];
        rectangle[0] = new Area();
        rectangle[0].RectangleArea(10, 20);

        rectangle[1] = new Area();
        rectangle[1].RectangleArea(15, 18);
        
        rectangle[2] = new Area();
        rectangle[2].RectangleArea(8, 6);
        
        rectangle[3] = new Area();
        rectangle[3].RectangleArea(3, 30);
        System.out.println();
        
        Area[] square = new Area[4];
        square[0] = new Area();
        square[0].SquareArea(10);

        square[1] = new Area();
        square[1].SquareArea(15);

        square[2] = new Area();
        square[2].SquareArea(100);

        square[3] = new Area();
        square[3].SquareArea(1);
        System.out.println();

        Area[] circle = new Area[5];
        circle[0] = new Area();
        circle[0].CircleArea(10);

        circle[1] = new Area();
        circle[1].CircleArea(15);

        circle[2] = new Area();
        circle[2].CircleArea(13);

        circle[3] = new Area();
        circle[3].CircleArea(1);

        circle[4] = new Area();
        circle[4].CircleArea(3);
    }
}
