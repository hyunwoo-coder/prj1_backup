package com.group4.erp;

public class MyWorkSearchDTO {

	private int selectPageNo=1;
	private int rowCntPerPage=10;
	private String search_keyword;
	private String[] category;
	private String searchCategory = "전체";
	private String emp_no;
	
	public String getEmp_no() {
		return emp_no;
	}
	public void setEmp_no(String emp_no) {
		this.emp_no = emp_no;
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
	public String getSearch_keyword() {
		return search_keyword;
	}
	public void setSearch_keyword(String search_keyword) {
		this.search_keyword = search_keyword;
	}
	public String[] getCategory() {
		return category;
	}
	public void setCategory(String[] category) {
		this.category = category;
	}
	public String getSearchCategory() {
		return searchCategory;
	}
	public void setSearchCategory(String searchCategory) {
		this.searchCategory = searchCategory;
	}

	private int searchEmpNo=0;

	public int getSearchEmpNo() {
		return searchEmpNo;
	}
	public void setSearchEmpNo(int searchEmpNo) {
		this.searchEmpNo = searchEmpNo;
	}
	
}
