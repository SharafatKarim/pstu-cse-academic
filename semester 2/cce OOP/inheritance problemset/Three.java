class Rectangle {
    Integer length;
    Integer width;

    public Rectangle(Integer length, Integer width) {
        this.length = length;
        this.width = width;
    }

    public Integer getArea() {
        return length * width;
    }

    public Integer getPerimeter() {
        return 2 * (length + width);
    }
}

class Square extends Rectangle {
    public Square(Integer side) {
        super(side, side);
    }
}

public class Three {
    public static void main(String[] args) {
        Square square = new Square(5);
        System.out.println("Square Area: " + square.getArea());
        System.out.println("Square Perimeter: " + square.getPerimeter());
    }
}