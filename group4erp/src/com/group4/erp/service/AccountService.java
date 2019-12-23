/*
 * 회계 업무 관련 기능들 처리
 * 
 * 
 */


package com.group4.erp.service;

import java.util.List;
import com.group4.erp.CorporationDTO;

public interface AccountService {
	
	int getCorpListCnt();
	
	List<CorporationDTO> getCorpList();

}
