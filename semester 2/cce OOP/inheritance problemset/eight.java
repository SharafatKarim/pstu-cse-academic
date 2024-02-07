class Point {
    float x;
    float y;

    Point(float a, float b) {
        x = a;
        y = b;
    }
}

class Quadrilateral {
    private Point p1, p2, p3, p4;
    private float length, breadth;

    Quadrilateral(float x1, float y1, float x2, float y2, float x3, float y3, float x4, float y4) {
        p1 = new Point(x1, y1);
        p2 = new Point(x2, y2);
        p3 = new Point(x3, y3);
        p4 = new Point(x4, y4);

        length = length(p1, p2);
        breadth = length(p3, p4);
    }

    float length(Point a, Point b) {
        return (float) Math.sqrt(Math.pow(a.x - b.x, 2) + Math.pow(a.y - b.y, 2));
    }

    float getLength() {
        return length;
    }

    float getBreadth() {
        return breadth;
    }

    float getArea() {
        return 0;
    }

    float getPperimeter() {
        return 0;
    }
}

class Trapezoid extends Quadrilateral {
    Trapezoid(float x1, float y1, float x2, float y2, float x3, float y3, float x4, float y4) {
        super(x1, y1, x2, y2, x3, y3, x4, y4);
    }

    @Override
    float getPperimeter() {
        return getLength() + getBreadth() + getLength() + getBreadth();
    }

    @Override
    float getArea() {
        return (getLength() + getBreadth()) / 2;
    }
}

class Parallelogram extends Quadrilateral {
    Parallelogram(float x1, float y1, float x2, float y2, float x3, float y3, float x4, float y4) {
        super(x1, y1, x2, y2, x3, y3, x4, y4);
    }

    @Override
    float getPperimeter() {
        return 2 * (getLength() + getBreadth());
    }

    @Override
    float getArea() {
        return getLength() * getBreadth();
    }
}

class Rectangle extends Parallelogram {
    Rectangle(float x1, float y1, float x2, float y2) {
        super(x1, y1, x2, y2, x1, y1, x2, y2);
    }

    @Override
    float getPperimeter() {
        return 2 * (getLength() + getBreadth());
    }

    @Override
    float getArea() {
        return getLength() * getBreadth();
    }
}

class Square extends Rectangle {
    Square(float x1, float y1) {
        super(x1, y1, x1, y1);
    }

    @Override
    float getPperimeter() {
        return 4 * getLength();
    }

    @Override
    float getArea() {
        return getLength() * getLength();
    }

    public class eight {
        public static void main(String[] args) {
            Square s = new Square(5, 5);
            System.out.println("Area of square: " + s.getArea());
            System.out.println("Perimeter of square: " + s.getPperimeter());
        
            Rectangle r = new Rectangle(5, 10, 15, 10);
            System.out.println("Area of rectangle: " + r.getArea());
            System.out.println("Perimeter of rectangle: " + r.getPperimeter());

            Parallelogram p = new Parallelogram(5, 10, 15, 10, 20, 20, 10, 20);
            System.out.println("Area of parallelogram: " + p.getArea());
            System.out.println("Perimeter of parallelogram: " + p.getPperimeter());

            Trapezoid t = new Trapezoid(5, 10, 15, 10, 20, 20, 10, 20);
            System.out.println("Area of trapezoid: " + t.getArea());
            System.out.println("Perimeter of trapezoid: " + t.getPperimeter());
        }
    }
}