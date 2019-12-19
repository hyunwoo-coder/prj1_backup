package com.group4.erp;

public class SalaryDTO {


	private int emp_no;
	private String emp_name;
	private String jikup;
	private String salary_dt;
	private int salary;
	private double real_sal;
	private double deduct_sal;
	private double final_sal;
	
	private double income;
	private double resident = 0.1d;
	private double emp_insurance = 0.08d;
	private double health_care = 0.0323d;
	private double annuity = 0.045d;
	
	private String year;
	private String month;
	

	
	public double getIncome() {
		return income;
	}
	public void setIncome(double income) {
		this.income = income;
	}

	public double getResident() {
		return resident;
	}
	public void setResident(double resident) {
		this.resident = resident;
	}

	public double getDeduct_sal() {
		return deduct_sal;
	}
	public void setDeduct_sal(double deduct_sal) {
		this.deduct_sal = deduct_sal;
	}
	

	public double getEmp_insurance() {
		return emp_insurance;
	}
	public void setEmp_insurance(double emp_insurance) {
		this.emp_insurance = emp_insurance;
	}
	
	public double getAnnuity() {
		return annuity;
	}
	public void setAnnuity(double annuity) {
		this.annuity = annuity;
	}
	
	public double getHealth_care() {
		return health_care;
	}
	public void setHealth_care(double d) {
		this.health_care = d;
	}
	
	public int getEmp_no() {
		return emp_no;
	}
	public void setEmp_no(int emp_no) {
		this.emp_no = emp_no;
	}
	public String getEmp_name() {
		return emp_name;
	}
	public void setEmp_name(String emp_name) {
		this.emp_name = emp_name;
	}
	public String getSalary_dt() {
		return salary_dt;
	}
	public void setSalary_dt(String salary_dt) {
		this.salary_dt = salary_dt;
	}
	
	public String getJikup() {
		return jikup;
	}
	public void setJikup(String jikup) {
		this.jikup = jikup;
	}
	public int getSalary() {
		return salary;
	}
	public void setSalary(int salary) {
		this.salary = salary;
	}
	public double getReal_sal() {
		return real_sal;
	}
	public void setReal_sal(double real_sal) {
		this.real_sal = real_sal;
	}
	public double getFinal_sal() {
		return final_sal;
	}
	public void setFinal_sal(double final_sal) {
		this.final_sal = final_sal;
	}


	public String getYear() {
		return year;
	}
	public void setYear(String year) {
		this.year = year;
	}
	public String getMonth() {
		return month;
	}
	public void setMonth(String month) {
		this.month = month;
	}
	
	
}
