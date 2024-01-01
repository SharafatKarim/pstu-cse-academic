// 3. Create a class named Pizza that stores information about a single pizza. It should contain the
// following:
// ⊚ Private instance variables to store the size of the pizza (either small, medium, or large), the number of
// cheese toppings, the number of pepperoni toppings, and the number of ham toppings
// ⊚ Constructor(s) that set all of the instance variables.
// ⊚ Public methods to get and set the instance variables.
// ⊚ A public method named calcCost( ) that returns a double that is the cost of the pizza.
// Pizza cost is determined by:
// Small: $10 + $2 per topping
// Medium: $12 + $2 per topping
// Large: $14 + $2 per topping
// ⊚ public method named getDescription( ) that returns a String containing the pizza size, quantity of
// each topping.
// Write test code to create several pizzas and output their descriptions. For example, a large pizza with
// one cheese, one pepperoni and two ham toppings should cost a total of $22. Now Create a PizzaOrder
// class that allows up to three pizzas to be saved in an order. Each pizza saved should be a Pizza object.
// Create a method calcTotal() that returns the cost of order. In the runner order two pizzas and return the
// total cost.

class Pizza {
    private String size;
    private int cheeseToppings;
    private int pepperoniToppings;
    private int hamToppings;

    public String getSize() {
        return size;
    }

    public int getCheeseToppings() {
        return cheeseToppings;
    }

    public int getPepperoniToppings() {
        return pepperoniToppings;
    }

    public int getHamToppings() {
        return hamToppings;
    }

    public void setSize(String size) {
        if (size.equals("small") || size.equals("medium") || size.equals("large")) {
            this.size = size;
        } else {
            System.out.println("Invalid size!");
        }
    }

    public void setCheeseToppings(int cheeseToppings) {
        this.cheeseToppings = cheeseToppings;
    }

    public void setPepperoniToppings(int pepperoniToppings) {
        this.pepperoniToppings = pepperoniToppings;
    }

    public void setHamToppings(int hamToppings) {
        this.hamToppings = hamToppings;
    }

    public Pizza(String size, int cheeseToppings, int pepperoniToppings, int hamToppings) {
        setSize(size);
        this.cheeseToppings = cheeseToppings;
        this.pepperoniToppings = pepperoniToppings;
        this.hamToppings = hamToppings;
    }

    // overloaded constructor
    public Pizza() {
        this("small", 0, 0, 0);
    }

    public double calcCost() {
        double cost = 0;
        switch (size) {
            case "small":
                cost = 10;
                break;
            case "medium":
                cost = 12;
                break;
            case "large":
                cost = 14;
                break;
        }
        cost += (cheeseToppings + pepperoniToppings + hamToppings) * 2;
        return cost;
    }

    public String getDescription() {
        return "Pizza{" +
                "size='" + size + '\'' +
                ", cheeseToppings=" + cheeseToppings +
                ", pepperoniToppings=" + pepperoniToppings +
                ", hamToppings=" + hamToppings +
                ", cost=" + calcCost() +
                '}';
    }

}

public class Three {
    public static void main(String[] args) {
        Pizza p1 = new Pizza();
        Pizza p2 = new Pizza("medium", 2, 2, 3);
        Pizza p3 = new Pizza("small", 3, 3, 4);
        p3.setSize("large");

        System.out.println(p1.getDescription());
        System.out.println(p2.getDescription());
        System.out.println(p3.getDescription());
    }
}
