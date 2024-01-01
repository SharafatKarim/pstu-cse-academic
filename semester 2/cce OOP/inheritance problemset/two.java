class one {
    void print()
    {
        System.out.println("This is parent class");
    }
    void print_two()
    {
        print();
    }    
}

class two extends one {
    void print_two()
    {
        System.out.println("This is child class");
    }
}

class Main {
    public static void main(String[] args) {
        one obOne = new one();
        obOne.print();

        two obj = new two();
        obj.print_two();
        obj.print();
    }
}