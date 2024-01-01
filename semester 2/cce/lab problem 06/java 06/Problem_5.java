public class Problem_5 {
    public static void main(String[] args) {
        int ar[] = { 2, 6, 3, 10, 25, 13, 20, 10, 5 , 2, 6, 3, 10};
        boolean num = false;

        for (var i = 2; i < ar.length - 1; i++) {
            if (ar[i] == ar[0] && ar[i + 1] == ar[1])
            {
                var j = i+2;
                while (j < ar.length && ar[j] == ar[j-i])
                {
                    if (j == ar.length - 1)
                    {
                        num = true;
                        break;
                    }
                    j++;
                }
            }
        }
        System.out.println(num);
    }
}
