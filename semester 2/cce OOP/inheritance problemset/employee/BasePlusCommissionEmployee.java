package employee;

public class BasePlusCommissionEmployee{
    private double baseSalary;
    private CommissionEmployee commissionEmployee;

    // constructor
    public BasePlusCommissionEmployee(String first, String last, String ssn,
            double sales, double rate, double salary){

        commissionEmployee = new CommissionEmployee(first, last, ssn, sales, rate);

        setBaseSalary(salary);
    }
    // SETTERS
    public void setFirstName(String first){
        commissionEmployee.setFirstName(first);
    }
    public void setLastName(String last){
        commissionEmployee.setLastName(last);
    }
    public void setSocialSecurityNumber(String ssn){
        commissionEmployee.setSocialSecurityNumber(ssn);
    }
    public void setGrossSales(double gross){
        commissionEmployee.setGrossSales(gross);
    }
    public void setCommissionRate(double commission){
        commissionEmployee.setCommissionRate(commission);
    }
    public void setBaseSalary(double salary){
        if(salary >= 0.0f)
            this.baseSalary = salary;
        else
            throw new IllegalArgumentException(
                    "Base salary must be >= 0.0f");
    }
    // GETTERS
    public String getFirstName(){
        return commissionEmployee.getFirstName();
    }
    public String getLastName(){
        return commissionEmployee.getLastName();
    }
    public String getSocialSecurityNumber(){
        return commissionEmployee.getSocialSecurityNumber();
    }
    public double getGrossSales(){
        return commissionEmployee.getGrossSales();
    }
    public double getCommissionRate(){
        return commissionEmployee.getCommissionRate();
    }
    public double getBaseSalary(){
        return this.baseSalary;
    }
    // calculate earnings
    public double earnings(){
        return getBaseSalary() + commissionEmployee.earnings();
    }
    // return String representation of object
    public String toString(){
        return String.format(
                "%s %s\n%s: %.2f", "base salaried", commissionEmployee.toString(),
                "base salary", getBaseSalary());
    }
}
