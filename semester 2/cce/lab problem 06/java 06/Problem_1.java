public class Problem_1 {
    public static void main(String[] args) {
        int ar[] = { 10, 25, 13, 20, 10};
        int num_10 = 0, num_20 = 0;

        for (var i: ar)
        {
            if (i == 10)
                num_10++;
            if (i == 20)
                num_20++;
        }

        if (num_10 > num_20)
            System.out.println(true);
        else
            System.out.println(false);
    }
}
