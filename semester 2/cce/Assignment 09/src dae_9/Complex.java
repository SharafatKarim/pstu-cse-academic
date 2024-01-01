public class Complex {
    private float real;
    private float imaginary; 
    
    public Complex(float real, float imaginary) {
        this.real = real;
        this.imaginary = imaginary;
    }

    public Complex() {
        this(0, 0);
    }

    public void addNumber(float real, float imaginary) {
        this.real += real;
        this.imaginary += imaginary;
    }

    public void substrNumber(float real, float imaginary) {
        this.real = real - this.real;
        this.imaginary = imaginary - this.imaginary;
    }

    public String toString() {
        return String.format("%f + %fi", this.real, this.imaginary);
    }

    public static void main(String[] args) {
        Complex complex = new Complex(1, 2);
        System.out.println(complex);
        complex.addNumber(3, 4);
        System.out.println(complex);
        complex.substrNumber(5, 6);
        System.out.println(complex);
    }
}
