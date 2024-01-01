public class Problem_2 {
    public static void main(String[] args) {
        int ar[] = { 10, 25, 13, 20, 10 };
        boolean num = false;

        for (var i : ar) {
            if (i == 10 || i == 30) {
                num = true;
                break;
            }
        }

        if (num)
            System.out.println(true);
        else
            System.out.println(false);
    }
}
