import java.util.Arrays;
import java.util.Collections;
import java.util.List;

/**
 * Problem_1
 */
public class Problem_1 {

    public static void main(String[] args) {
        Integer arr[] = { 15, 15, 109, 200, 30, 14, 55 };
        Character c_arr[] = { 'a', 'f', 'b', 'c', 'e', 'e', 'z' };

        List <Integer> int_list = Arrays.asList(arr);
        List <Character> char_list = Arrays.asList(c_arr);

        Collections.sort(int_list);
        Collections.sort(char_list);

        System.out.println("Sorted Integer List: " + int_list);
        System.out.println("Sorted Character List: " + char_list);
    }
}