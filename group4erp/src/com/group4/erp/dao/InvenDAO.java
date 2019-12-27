package com.group4.erp.dao;

import java.util.List;
import java.util.Map;

import com.group4.erp.*;



public interface InvenDAO {


	List<Map<String, String>> getPublisher(InvenSearchDTO invenSearchDTO);
	
	List<Map<String, String>> getInvenLoc(InvenSearchDTO invenSearchDTO);
	
	int getBookListCnt(InvenSearchDTO invenSearchDTO);
	
	List<Map<String,String>> getBookList(InvenSearchDTO invenSearchDTO);
	
	int getReleaseListCnt(InvenSearchDTO invenSearchDTO);
	
	List<Map<String,String>> getReleaseList(InvenSearchDTO invenSearchDTO);

	Cus_releaseInfoDTO getReleaseCusInfo(int all_order_no);
	
	Cus_releaseInfoDTO getReleaseCorpInfo(int all_order_no);


	int getReturnOrderCnt();
	
	List<ReturnOrderDTO> getReturnOrderList();


	int getSignUpCnt(InvenDTO invenDTO);
	
}