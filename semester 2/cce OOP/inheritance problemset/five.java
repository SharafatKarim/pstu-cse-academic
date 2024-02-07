class Rectangle {
    int length;
    int breadth;
    Rectangle(int x, int y) {
        length = x;
        breadth = y;
    }
    int area() {
        return length * breadth;
    }
    int perimeter() {
        return 2 * (length + breadth);
    }
}

class square extends Rectangle {
    square(int x) {
        super(x, x);
    }
}

class Five {
    public static void main(String[] args) {
        square s = new square(15);
        System.out.println("Area of square: " + s.area());
        System.out.println("Perimeter of square: " + s.perimeter());
    }
}