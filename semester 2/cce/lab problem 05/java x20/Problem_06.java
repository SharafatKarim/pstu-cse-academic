public class Problem_06 {
    public static void main(String[] args) {
        int a[] = {50, -20, 0};
        int b[] = {5, -50, 10};
        int c[] = {a[0], b[b.length-1]};

        for (var i: c)
            System.out.println(i);
    }
}
