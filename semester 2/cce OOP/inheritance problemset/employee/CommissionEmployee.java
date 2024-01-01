package employee;

public class CommissionEmployee {
    String first;
    String last;
    String ssn;
    double sales;
    double rate;

    // constructor
    public CommissionEmployee(String first, String last, String ssn,
            double sales, double rate){

        setFirstName(first);
        setLastName(last);
        setSocialSecurityNumber(ssn);
        setGrossSales(sales);
        setCommissionRate(rate);
    }

    // SETTERS
    public void setFirstName(String first){
        this.first = first;
    }
    public void setLastName(String last){
        this.last = last;
    }
    public void setSocialSecurityNumber(String ssn){
        this.ssn = ssn;
    }
    public void setGrossSales(double gross){
        if(gross >= 0.0f)
            this.sales = gross;
        else
            throw new IllegalArgumentException(
                    "Gross sales must be >= 0.0f");
    }
    public void setCommissionRate(double commission){
        if(commission > 0.0f && commission < 1.0f)
            this.rate = commission;
        else
            throw new IllegalArgumentException(
                    "Commission rate must be > 0.0f and < 1.0f");
    }
    // GETTERS
    public String getFirstName(){
        return this.first;
    }
    public String getLastName(){
        return this.last;
    }
    public String getSocialSecurityNumber(){
        return this.ssn;
    }
    public double getGrossSales(){
        return this.sales;
    }
    public double getCommissionRate(){
        return this.rate;
    }
    // calculate earnings
    public double earnings(){
        return getCommissionRate() * getGrossSales();
    }
}
