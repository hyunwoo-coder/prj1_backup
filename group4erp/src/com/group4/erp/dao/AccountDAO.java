package com.group4.erp.dao;

import java.util.List;

import com.group4.erp.CorporationDTO;

public interface AccountDAO {
	
	int getCorpListCnt();
	
	List<CorporationDTO> getCorpList();

}
