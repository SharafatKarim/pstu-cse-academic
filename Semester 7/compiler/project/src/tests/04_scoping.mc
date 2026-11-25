int main() {
    int x = 10;
    println(x); // 10

    {
        // Shadow x in inner block
        float x = 3.14;
        println(x); // 3.14

        {
            int x = 999;
            println(x); // 999
        }

        println(x); // 3.14
    }

    println(x); // 10
    return 0;
}
