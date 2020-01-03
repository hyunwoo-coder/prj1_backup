package com.group4.erp;

public class BusinessTripDTO {
	private int emp_no;
	private int work_outside_seq;
	private String destination;
	private String work_outside_reason;
	private String outside_start_time;
	private String outside_end_time;
	
	public int getEmp_no() {
		return emp_no;
	}
	public void setEmp_no(int emp_no) {
		this.emp_no = emp_no;
	}
	public String getDestination() {
		return destination;
	}
	public void setDestination(String destination) {
		this.destination = destination;
	}
	public String getWork_outside_reason() {
		return work_outside_reason;
	}
	public void setWork_outside_reason(String work_outside_reason) {
		this.work_outside_reason = work_outside_reason;
	}
	public String getOutside_start_time() {
		return outside_start_time;
	}
	public void setOutside_start_time(String outside_start_time) {
		this.outside_start_time = outside_start_time;
	}
	public String getOutside_end_time() {
		return outside_end_time;
	}
	public void setOutside_end_time(String outside_end_time) {
		this.outside_end_time = outside_end_time;
	}
	public int getWork_outside_seq() {
		return work_outside_seq;
	}
	public void setWork_outside_seq(int work_outside_seq) {
		this.work_outside_seq = work_outside_seq;
	}
	
}
