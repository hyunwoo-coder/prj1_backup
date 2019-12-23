package com.group4.erp.service;
import com.group4.erp.InvenSearchDTO;
import com.group4.erp.MyWorkSearchDTO;

import java.util.*;

public interface MyWorkService {

	//검색 조건 불러오는 부분
	List<Map<String,String>> getMyCareBookList(MyWorkSearchDTO myWorkSearchDTO);
	List<Map<String,String>> getCategoryList(MyWorkSearchDTO myWorkSearchDTO);
	List<Map<String,String>> getBookSizeList(MyWorkSearchDTO myWorkSearchDTO);
	List<Map<String,String>> getBranchList(MyWorkSearchDTO myWorkSearchDTO);
	List<Map<String,String>> getPublisherList(MyWorkSearchDTO myWorkSearchDTO);
	
	//페이징 처리용 총 개수 호출
	int getMyWorkListAllCnt(MyWorkSearchDTO myWorkSearchDTO);
}
