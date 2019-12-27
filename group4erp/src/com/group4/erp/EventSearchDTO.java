package com.group4.erp;

public class EventSearchDTO {
	
	private String searchKeyword;
	private int selectPageNo=1;
	private int rowCntPerPage=10;
	private String evnt_category[];
	private String evnt_stat[];

	
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
	
	public String[] getEvnt_category() {
		return evnt_category;
	}
	
	public void setEvnt_category(String[] evnt_category) {
		this.evnt_category = evnt_category;
	}
	
	public String[] getEvnt_stat() {
		return evnt_stat;
	}
	
	public void setEvnt_stat(String[] evnt_stat) {
		this.evnt_stat = evnt_stat;
	}
}
