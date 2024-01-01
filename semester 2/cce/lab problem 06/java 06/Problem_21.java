import java.util.LinkedList;

public class Problem_21 {
    public static void main(String[] args) {
        LinkedList<Integer> list = new LinkedList<Integer>();
        list.add(1);
        list.add(2);
        list.add(3);
        list.add(4);
        list.add(5);

        LinkedList<Integer> list2 = new LinkedList<Integer>();
        for (var i = list.size() - 1; i >= 0; i--) {
            list2.add(list.get(i));
        }

        System.out.println(list2);
    }
}
