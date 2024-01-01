public class Problem_39 {
    public static void main(String[] args) {
        int arr[] = {1, -2, 0, 5, -1, -4};

        for (int i = 0; i < arr.length; i++) {
            boolean isLeader = true;
            for (int j = i + 1; j < arr.length; j++) {
                if (arr[i] <= arr[j]) {
                    isLeader = false;
                    break;
                }
            }
            if (isLeader) {
                System.out.println("Leader: " + arr[i]);
            }
        }
    }
}
