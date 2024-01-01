public class Problem_20 {
    public static void main(String[] args) {
        String string1 = "Hello world";
        String string2 = new StringBuffer("Hello").append(" world").toString();
        String string3 = string2.intern();

        System.out.println(string1 == string2); // false
        System.out.println(string1 == string3); // false
        System.out.println(string2 == string3); // true

        String str = new String("Welcome to JavaTpoint"); // statement - 1  
        String str1 = new String("Welcome to JavaTpoint"); // statement - 2  
        System.out.println(str1 == str); // prints true  
    }
}
