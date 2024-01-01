// 3.We have to calculate the percentage of marks obtained in three subjects (each out of 100)
// by student A and in four subjects (each out of 100) by student B. Create an abstract class
// 'Marks' with an abstract method 'getPercentage'. It is inherited by two other classes 'A'
// and 'B' each having a method with the same name which returns the percentage of the
// students. The constructor of student A takes the marks in three subjects as its parameters
// and the marks in four subjects as its parameters for student B. Create an object for eac of
// the two classes and print the percentage of marks for both the students.

abstract class Marks {
    abstract int getPercentage();
}

class A extends Marks {
    int subject_one;
    int subject_two;
    int subject_three;

    public A(int subject_one, int subject_two, int subject_three) {
        this.subject_one = subject_one;
        this.subject_two = subject_two;
        this.subject_three = subject_three;
    }

    @Override
    int getPercentage() {
        return (subject_one + subject_two + subject_three) * 100 / 300;
    }

}

class B extends Marks {
    int subject_one;
    int subject_two;
    int subject_three;
    int subject_four;

    public B(int subject_one, int subject_two, int subject_three, int subject_four) {
        this.subject_one = subject_one;
        this.subject_two = subject_two;
        this.subject_three = subject_three;
        this.subject_four = subject_four;
    }

    @Override
    int getPercentage() {
        return (subject_one + subject_two + subject_three + subject_four) * 100 / 400;
    }

}

public class Problem_3 {
    public static void main(String[] args) {
        A a = new A(100, 80, 65);
        System.out.println(a.getPercentage());
        
        B b = new B(100, 80, 65, 75);
        System.out.println(b.getPercentage());
    }
}
