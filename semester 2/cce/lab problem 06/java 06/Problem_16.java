public class Problem_16 {
    public static void main(String[] args) {
        for (int i=1; i <= 100; i++)
        {
            if (i % 5 == 0 && i % 3 == 0)
                System.out.println("Fizz buzz");
            else if (i % 3 == 0)
                System.out.println("Fizz");
            else if (i % 5 == 0)
                System.out.println("Buzz");
        }
    }
}
