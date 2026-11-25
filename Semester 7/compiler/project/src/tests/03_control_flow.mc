int main() {
    int score = 85;
    if (score >= 90) {
        println(1);
    } else {
        if (score >= 80) {
            println(2); // prints 2
        } else {
            println(3);
        }
    }

    // While loop: factorial of 5 = 120
    int n = 5;
    int fact = 1;
    while (n > 1) {
        fact = fact * n;
        n = n - 1;
    }
    println(fact); // 120

    return 0;
}
