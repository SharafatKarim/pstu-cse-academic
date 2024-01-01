class Shape {
    public void draw_shape() {
        System.out.println("This is Shape");
    }
}

class Rectangle extends Shape {
    public void draw_rectangle() {
        System.out.println("This is Rectangluar shape");
    }
}

class Circle extends Shape {
    public void draw_circle() {
        System.out.println("This is Circular shape");
    }
}

class Square extends Rectangle {
    public void draw_square() {
        System.out.println("Square is a rectangle");
    }
}

public class Six {
    public static void main(String[] args) {
        Square square = new Square();
        square.draw_shape();
        square.draw_rectangle();
    }
}
