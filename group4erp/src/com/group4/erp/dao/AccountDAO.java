package com.group4.erp.dao;

import java.util.List;

import com.group4.erp.CorpOrderDTO;
import com.group4.erp.CorpSearchDTO;
import com.group4.erp.CorporationDTO;
import com.group4.erp.TranSpecDTO;

public interface AccountDAO {
	
	int getCorpListCnt();
	
	List<CorporationDTO> getCorpList(CorpSearchDTO corpSearchDTO);
	
	CorporationDTO selectCorp(String corp_no);
	
	int insertCorp(CorporationDTO corporationDTO);
	
	CorporationDTO getCorpInfo(String corp_no);
	
	int getCorpOrderCnt(CorpSearchDTO corpSearchDTO);
	
	List<CorpOrderDTO> getCorpOrderList(CorpSearchDTO corpSearchDTO);
	
	int getTranSpecCnt(int order_no);
	
	List<TranSpecDTO> getTranSpecList(int order_no);
	
	int deleteCorp(String[] corp_no);

}
