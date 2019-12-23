package com.group4.erp;

public class InvenSearchDTO {
	private String keyword1;
	private String[] date;
	private int selectPageNo=1;
	private int rowCntPerPage=10;
	private String[] publisher;
	
	public String getKeyword1() {
		return keyword1;
	}
	public void setKeyword1(String keyword1) {
		this.keyword1 = keyword1;
	}
	public String[] getDate() {
		return date;
	}
	public void setDate(String[] date) {
		this.date = date;
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
	public String[] getPublisher() {
		return publisher;
	}
	public void setPublisher(String[] publisher) {
		this.publisher = publisher;
	}
	


}
