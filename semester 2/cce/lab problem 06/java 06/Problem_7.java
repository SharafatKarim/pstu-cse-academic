public class Problem_7 {
    public static void main(String[] args) {
        int ar[] = { 10, 25, 13, 13, 13,20, 10 };
        boolean num = false;

        for (int i=0; i < ar.length-2; i++) {
            if (ar[i] == ar[i+1] && ar[i] == ar[i+2]) {
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
