public class Problem_5 {

    public static void main(String[] args) {
        Integer arr[] = { 15, 15, 109, 200, 30, 14, 55 };
        int value_to_find = 200;

        boolean found = false;
        for (var i : arr) {
            if (i == value_to_find) {
                found = true;
                break;
            }
        }

        if (found) {
            System.out.println("Value found in the array");
        } else {
            System.out.println("Value not found in the array");
        }
    }
}