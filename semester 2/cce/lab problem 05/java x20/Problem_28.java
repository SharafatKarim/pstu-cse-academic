public class Problem_28 {
    public static void main(String[] args) {
        int arr1[] = { 10, 20, 10, 30, 10, 40};
        
        boolean lg = true;

        int f_element = arr1[0];
        for (int i = 0; i < arr1.length; i+= 2)
        {
            if (arr1[i] != f_element)
                lg = false;
        }

        if (lg)
            System.out.println(true);
        else
        {
            lg = true;
            f_element = arr1[1];
            for (int i = 1; i < arr1.length; i+= 2)
            {
                if (arr1[i] != f_element)
                    lg = false;
            }
            System.out.println(lg);
        }
    }
}
