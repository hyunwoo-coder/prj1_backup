package com.group4.erp.service;
import com.group4.erp.Cus_releaseInfoDTO;
import com.group4.erp.InvenDTO;
import com.group4.erp.InvenSearchDTO;
import com.group4.erp.ReturnOrderDTO;
import com.group4.erp.ReturnSearchDTO;

import java.util.*;

public interface InvenService {
	List<Map<String, String>> getBranch(InvenSearchDTO invenSearchDTO);

	List<Map<String, String>> getPublisher(InvenSearchDTO invenSearchDTO);
	
	List<Map<String, String>> getInvenLoc(InvenSearchDTO invenSearchDTO);
	
	int getBookListCnt(InvenSearchDTO invenSearchDTO);
	
	List<Map<String,String>> getBookList(InvenSearchDTO invenSearchDTO);
	
	int getReturnOrderCnt(ReturnSearchDTO returnSearchDTO);

	int getReleaseListCnt(InvenSearchDTO invenSearchDTO);
	
	List<Map<String,String>> getReleaseList(InvenSearchDTO invenSearchDTO);
	
	Cus_releaseInfoDTO getReleaseCusInfo(int all_order_no);
	
	Cus_releaseInfoDTO getReleaseCorpInfo(int all_order_no);

	int getReturnOrderCnt();

	List<ReturnOrderDTO>getReturnOrderList(ReturnSearchDTO returnSearchDTO);

	List<ReturnOrderDTO>getReturnOrderList();

	int getSignUpCnt(InvenDTO invenDTO);


}
