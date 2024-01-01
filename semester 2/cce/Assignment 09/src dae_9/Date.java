// Fig. 8.7: Date.java
// Date class declaration.
public class Date {
    private int month; // 1-12
    private int day; // 1-31 based on month
    private int year; // any year
    private static final int[] daysPerMonth = { 0, 31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31 };

    // constructor: confirm proper value for month and day given the year
    public Date(int month, int day, int year) {
        if (year <= 0)
            throw new IllegalArgumentException("year (" + year + ") must be greater than 0"); 
        // check if month in range
        if (month <= 0 || month > 12)
            throw new IllegalArgumentException(
                    "month (" + month + ") must be 1-12");
        // check if day in range for month
        if (day <= 0 || (day > daysPerMonth[month] && !(month == 2 && day == 29)))
            throw new IllegalArgumentException("day (" + day + ") out-of-range for the specified month and year");
        // check for leap year if month is 2 and day is 29
        if (month == 2 && day == 29 && !(year % 400 == 0 || (year % 4 == 0 && year % 100 != 0)))
            throw new IllegalArgumentException("day (" + day + ") out-of-range for the specified month and year");
        this.month = month;
        this.day = day;
        this.year = year;
        System.out.printf("Date object constructor for date %s%n", this);
    }

    public void nextDay() {
        if (day == daysPerMonth[month]) {
            day = 1;
            if (month == 12) {
                month = 1;
                year++;
            } else
                month++;
        } else
            day++;
    }

    public void nextMonth() {
        if (month == 12) {
            month = 1;
            year++;
        } else
            month++;
    }

    public void nextYear() {
        year++;
    }

    // return a String of the form month/day/year
    public String toString() {
        return String.format("%d/%d/%d", month, day, year);
    }

    public static void main(String[] args) {
        Date date = new Date(12, 30, 2020);
        System.out.println(date);
        date.nextMonth();
        System.out.println(date);
        date.nextYear();
        System.out.println(date);
    }
}
// end class Date
