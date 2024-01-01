// Date class declaration.
class Date {
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
        // System.out.printf("Date object constructor for date %s%n", this);
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
}
// end class Date

class Time {
    private int hour; // 0 - 23
    private int minute; // 0 - 59
    private int second; // 0 - 59
    // Time2 no-argument constructor:
    // initializes each instance variable to zero

    public Time() {
        this(0, 0, 0); // invoke constructor with three arguments
    }

    // Time2 constructor: hour supplied, minute and second defaulted to 0
    public Time(int hour) {
        this(hour, 0, 0); // invoke constructor with three arguments
    }

    // Time2 constructor: hour and minute supplied, second defaulted to 0
    public Time(int hour, int minute) {
        this(hour, minute, 0); // invoke constructor with three arguments
    }

    // Time2 constructor: hour, minute and second supplied
    public Time(int hour, int minute, int second) {
        if (hour < 0 || hour >= 24)
            throw new IllegalArgumentException("hour must be 0-23");
        if (minute < 0 || minute >= 60)
            throw new IllegalArgumentException("minute must be 0-59");
        if (second < 0 || second >= 60)
            throw new IllegalArgumentException("second must be 0-59");
        this.hour = hour;
        this.minute = minute;
        this.second = second;
    }

    // Time2 constructor: another Time2 object supplied
    public Time(Time2Second time) {
        // invoke constructor with three arguments
        this(time.getHour(), time.getMinute(), time.getSecond());
    }

    // Set Methods
    // set a new time value using universal time;
    // validate the data
    public void setTime(int hour, int minute, int second) {
        if (hour < 0 || hour >= 24)
            throw new IllegalArgumentException("hour must be 0-23");
        if (minute < 0 || minute >= 60)
            throw new IllegalArgumentException("minute must be 0-59");
        if (second < 0 || second >= 60)
            throw new IllegalArgumentException("second must be 0-59");
        this.hour = hour;
        this.minute = minute;
        this.second = second;
    }

    // validate and set hour
    public void setHour(int hour) {
        if (hour < 0 || hour >= 24)
            throw new IllegalArgumentException("hour must be 0-23");
        this.hour = hour;
    }

    // validate and set minute
    public void setMinute(int minute) {
        if (minute < 0 || minute >= 60)
            throw new IllegalArgumentException("minute must be 0-59");
        this.minute = minute;
    }

    // validate and set second
    public void setSecond(int second) {
        if (second < 0 || second >= 60)
            throw new IllegalArgumentException("second must be 0-59");
        this.second = second;
    }

    // Get Methods
    // get hour value
    public int getHour() {
        return hour;
    }

    // get minute value
    public int getMinute() {
        return minute;
    }

    // get second value
    public int getSecond() {
        return second;
    }

    // convert to String in universal-time format (HH:MM:SS)
    public String toUniversalString() {
        return String.format(
                "%02d:%02d:%02d", getHour(), getMinute(), getSecond());
    }

    // convert to String in standard-time format (H:MM:SS AM or PM)
    public String toString() {
        return String.format("%d:%02d:%02d %s",
                ((getHour() == 0 || getHour() == 12) ? 12 : getHour() % 12),
                getMinute(), getSecond(), (getHour() < 12 ? "AM" : "PM"));
    }

    public void incrementHour() {
        if (hour == 23) {
            hour = 0;
        } else {
            hour++;
        }
    }

    public void incrementMinute() {
        if (minute == 59) {
            minute = 0;
            incrementHour();
        } else {
            minute++;
        }
    }

    public void tick() {
        if (second == 59) {
            second = 0;
            incrementMinute();
        } else {
            second++;
        }
    }
}

public class DateAndTime {
    private Date date;
    private Time time;

    public DateAndTime(Date date, Time time) {
        this.date = date;
        this.time = time;
    }

    public void tick() {
        time.tick();
        if (time.getHour() == 0 && time.getMinute() == 0 && time.getSecond() == 0) {
            date.nextDay();
        }
    }

    public void incrementMinute() {
        time.incrementMinute();
        if (time.getHour() == 0 && time.getMinute() == 0) {
            date.nextDay();
        }
    }

    public void incrementHour() {
        time.incrementHour();
        if (time.getHour() == 0) {
            date.nextDay();
        }
    }

    public void incrementMonth() {
        date.nextMonth();
    }

    public void incrementYear() {
        date.nextYear();
    }

    public String toString() {
        return String.format("%s %s", date, time);
    }

    public static void main(String[] args) {
        Date date = new Date(1, 5, 2023);
        Time time = new Time(23, 59, 59);
        DateAndTime dateAndTime = new DateAndTime(date, time);

        System.out.println(dateAndTime);
        
        dateAndTime.incrementHour();
        dateAndTime.tick();
        System.out.println(dateAndTime);
    }
}