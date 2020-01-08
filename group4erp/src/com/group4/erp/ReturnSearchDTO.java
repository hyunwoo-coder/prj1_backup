package com.group4.erp;

public class ReturnSearchDTO {

	private String searchKeyword;
	private int selectPageNo=1;
	private int rowCntPerPage=10;	
	private String sort;
	private String return_cd[];
	private String return_dt;
	
	public String getReturn_dt() {
		return return_dt;
	}

	public void setReturn_dt(String return_dt) {
		this.return_dt = return_dt;
	}

	public String[] getReturn_cd() {
		return return_cd;
	}

	public void setReturn_cd(String[] return_cd) {
		this.return_cd = return_cd;
	}

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

	public String getSort() {
		return sort;
	}

	public void setSort(String sort) {
		this.sort = sort;
	}

}
