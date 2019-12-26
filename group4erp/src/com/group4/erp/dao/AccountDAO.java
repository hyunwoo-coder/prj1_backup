package com.group4.erp.dao;

import java.util.List;

import com.group4.erp.CorpOrderDTO;
import com.group4.erp.CorpSearchDTO;
import com.group4.erp.CorporationDTO;

public interface AccountDAO {
	
	int getCorpListCnt();
	
	List<CorporationDTO> getCorpList(CorpSearchDTO corpSearchDTO);
	
	int insertCorp(CorporationDTO corporationDTO);
	
	CorporationDTO getCorpInfo(String corp_no);
	
	int getCorpOrderCnt();
	
	List<CorpOrderDTO> getCorpOrderList();

}
