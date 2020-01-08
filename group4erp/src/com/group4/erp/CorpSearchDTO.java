package com.group4.erp;

public class CorpSearchDTO {
	
	private String searchKeyword;
	private int selectPageNo=1;
	private int rowCntPerPage=10;
	
	private String corp_no;
	private String order_books_no;
	private String corp_name;
	private String ceo_name;
	private int books_qty;
	private String order_dt;
	private String sort;
	
	


	public String getSearchKeyword() {
		return searchKeyword;
	}
	public void setSearchKeyword(String searchKeyword) {
		this.searchKeyword = searchKeyword;
	}
	public int getSelectPageNo() {
		return selectPageNo;
	}
	public void setSelectPageNo(int selectPageNo) {
		this.selectPageNo = selectPageNo;
	}
	public int getRowCntPerPage() {
		return rowCntPerPage;
	}
	public void setRowCntPerPage(int rowCntPerPage) {
		this.rowCntPerPage = rowCntPerPage;
	}
	public String getCorp_no() {
		return corp_no;
	}
	public void setCorp_no(String corp_no) {
		this.corp_no = corp_no;
	}
	public String getOrder_books_no() {
		return order_books_no;
	}
	public void setOrder_books_no(String order_books_no) {
		this.order_books_no = order_books_no;
	}
	public String getCorp_name() {
		return corp_name;
	}
	public void setCorp_name(String corp_name) {
		this.corp_name = corp_name;
	}
	public String getCeo_name() {
		return ceo_name;
	}
	public void setCeo_name(String ceo_name) {
		this.ceo_name = ceo_name;
	}
	public int getBooks_qty() {
		return books_qty;
	}
	public void setBooks_qty(int books_qty) {
		this.books_qty = books_qty;
	}
	public String getOrder_dt() {
		return order_dt;
	}
	public void setOrder_dt(String order_dt) {
		this.order_dt = order_dt;
	}
	public String getSort() {
		return sort;
	}
	public void setSort(String sort) {
		this.sort = sort;
	}
	
}
