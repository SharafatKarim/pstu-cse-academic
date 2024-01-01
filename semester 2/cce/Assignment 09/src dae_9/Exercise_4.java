class Cylinder {
    float radius = 1;
    float height = 1;

    float getVolume() {
        return (float) (Math.PI * Math.pow(radius, 2) * height);
    }

    public float getRadius() {
        return radius;
    }

    public void setRadius(float radius) {
        this.radius = radius;
    }

    public float getHeight() {
        if (height < 0) {
            throw new IllegalArgumentException("Height cannot be negative");
        }
        return height;
    }

    public void setHeight(float height) {
        if (height < 0) {
            throw new IllegalArgumentException("Height cannot be negative");
        }
        this.height = height;
    }
}

public class Exercise_4 {
    public static void main(String[] args) {
        Cylinder cylinder = new Cylinder();
        cylinder.setRadius(5);
        cylinder.setHeight(10);
        System.out.println("Volume of cylinder is " + cylinder.getVolume());
    }
}
