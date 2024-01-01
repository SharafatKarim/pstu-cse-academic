enum Food {
    APPLE("fruit", 95), BANANA("fruit", 105), CARROT("vegetable", 25);

    private final String type;
    private final int calories;

    Food(String type, int calories) {
        this.type = type;
        this.calories = calories;
    }

    public String getType() {
        return type;
    }

    public int getCalories() {
        return calories;
    }
}

public class Enum {
    public static void main(String[] args) {
        System.out.println();
        for (Food food : Food.values()) {
            System.out.printf("%s: %s, %d calories%n", food, food.getType(), food.getCalories());
        }
    }
}