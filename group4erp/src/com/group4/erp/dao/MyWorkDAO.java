package com.group4.erp.dao;

import java.util.List;
import java.util.Map;

import com.group4.erp.*;



public interface MyWorkDAO {


	//===================================================================================================
	//검색 항목 불러오는 코드
	List<Map<String,String>> getMyCareBookList(MyWorkSearchDTO myWorkSearchDTO);
	List<Map<String,String>> getCategoryList(MyWorkSearchDTO myWorkSearchDTO);
	List<Map<String,String>> getBookSizeList(MyWorkSearchDTO myWorkSearchDTO);
	List<Map<String,String>> getBranchList(MyWorkSearchDTO myWorkSearchDTO);
	List<Map<String,String>> getPublisherList(MyWorkSearchDTO myWorkSearchDTO);

	//===================================================================================================
	//페이징 처리를 위한 총 검색 개수 불러오는 코드
	int getMyWorkListAllCnt(MyWorkSearchDTO myWorkSearchDTO);

}
