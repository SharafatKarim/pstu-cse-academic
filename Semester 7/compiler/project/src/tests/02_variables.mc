int main() {
    int x = 100;
    int y = 50;
    int z = x - y;
    println(z); // 50

    float f1 = 12.5;
    float f2 = 2.5;
    float f3 = f1 + f2;
    println(f3); // 15.0

    // Implicit promotion: int promoted to float
    float mix = x + 0.5;
    println(mix); // 100.5

    // Reassignment
    x = 42;
    println(x); // 42

    return 0;
}
