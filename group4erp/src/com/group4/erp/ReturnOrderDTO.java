package com.group4.erp;

public class ReturnOrderDTO {
	
	private String return_sales_no;
	private String order_no;
	private String isbn13;
	private String return_cause;
	private String return_comment;

	
	public String getReturn_sales_no() {
		return return_sales_no;
	}
	public void setReturn_sales_no(String return_sales_no) {
		this.return_sales_no = return_sales_no;
	}
	public String getOrder_no() {
		return order_no;
	}
	public void setOrder_no(String order_no) {
		this.order_no = order_no;
	}
	public String getIsbn13() {
		return isbn13;
	}
	public void setIsbn13(String isbn13) {
		this.isbn13 = isbn13;
	}
	public String getReturn_cause() {
		return return_cause;
	}
	public void setReturn_cause(String return_cause) {
		this.return_cause = return_cause;
	}
	public String getReturn_comment() {
		return return_comment;
	}
	public void setReturn_comment(String return_comment) {
		this.return_comment = return_comment;
	}
	
}
