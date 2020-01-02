package com.group4.erp;

public class BusinessTripDTO {
	
	private int rownum;
	private int work_outside_seq;
	private String jikup;
	private String dep_name;
	private String destination;
	private String work_outside_reason;
	private String outside_start_time;
	private String outside_end_time;
	private String mgr_name;
	private int travel_payment;
	private int jikup_cd;
	
	public int getRownum() {
		return rownum;
	}
	public void setRownum(int rownum) {
		this.rownum = rownum;
	}
	public int getWork_outside_seq() {
		return work_outside_seq;
	}
	public void setWork_outside_seq(int work_outside_seq) {
		this.work_outside_seq = work_outside_seq;
	}
	public String getJikup() {
		return jikup;
	}
	public void setJikup(String jikup) {
		this.jikup = jikup;
	}
	public String getDep_name() {
		return dep_name;
	}
	public void setDep_name(String dep_name) {
		this.dep_name = dep_name;
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
	public String getMgr_name() {
		return mgr_name;
	}
	public void setMgr_name(String mgr_name) {
		this.mgr_name = mgr_name;
	}
	public int getJikup_cd() {
		return jikup_cd;
	}
	public void setJikup_cd(int jikup_cd) {
		this.jikup_cd = jikup_cd;
	}
	public int getTravel_payment() {
		return travel_payment;
	}
	public void setTravel_payment(int travel_payment) {
		this.travel_payment = travel_payment;
	}
}
