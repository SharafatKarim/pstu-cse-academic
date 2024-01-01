public class Problem_35 {
    public static void main(String[] args) {
        String str = "PQ";
        
       // char[] chars = str.toCharArray();
        permutation(str);
    }
    
    public static void  permutation(String str)
    {
        char[] chars = str.toCharArray();
        int len = str.length();
        char[] permutation = new char[len];
        
        printPermutation (chars, permutation,0,len);
    }
    
    public static void  printPermutation(char[] chars, char[] permutation, int strat, int end)
    {
        if(strat == end)
        {
            System.out.println(permutation);
            return ;
        }
        for (int i = 0; i < end; i++) {
            permutation[strat] = chars[i];
            printPermutation(chars,permutation,strat+1,end);
        }
    }
}