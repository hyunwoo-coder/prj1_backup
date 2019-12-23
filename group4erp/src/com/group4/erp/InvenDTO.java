package com.group4.erp;

public class InvenDTO {
	private int ISBN13;
	private String book_name;
	private int category_cd;
	private String book_price;
	private int book_pages;
	private String writer;
	private String publisher;
	private String book_cover;
	private int size_cd;
	private String is_not_print;
	private int emp_no;
	private String published_de;
	private String planner;
	
	public int getISBN13() {
		return ISBN13;
	}
	public void setISBN13(int iSBN13) {
		ISBN13 = iSBN13;
	}
	public String getBook_name() {
		return book_name;
	}
	public void setBook_name(String book_name) {
		this.book_name = book_name;
	}
	public int getCategory_cd() {
		return category_cd;
	}
	public void setCategory_cd(int category_cd) {
		this.category_cd = category_cd;
	}
	public String getBook_price() {
		return book_price;
	}
	public void setBook_price(String book_price) {
		this.book_price = book_price;
	}
	public int getBook_pages() {
		return book_pages;
	}
	public void setBook_pages(int book_pages) {
		this.book_pages = book_pages;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public String getPublisher() {
		return publisher;
	}
	public void setPublisher(String publisher) {
		this.publisher = publisher;
	}
	public String getBook_cover() {
		return book_cover;
	}
	public void setBook_cover(String book_cover) {
		this.book_cover = book_cover;
	}
	public int getSize_cd() {
		return size_cd;
	}
	public void setSize_cd(int size_cd) {
		this.size_cd = size_cd;
	}
	public String getIs_not_print() {
		return is_not_print;
	}
	public void setIs_not_print(String is_not_print) {
		this.is_not_print = is_not_print;
	}
	public int getEmp_no() {
		return emp_no;
	}
	public void setEmp_no(int emp_no) {
		this.emp_no = emp_no;
	}
	public String getPublished_de() {
		return published_de;
	}
	public void setPublished_de(String published_de) {
		this.published_de = published_de;
	}
	public String getPlanner() {
		return planner;
	}
	public void setPlanner(String planner) {
		this.planner = planner;
	}
	
}
