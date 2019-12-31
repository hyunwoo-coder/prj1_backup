package com.group4.erp.dao;

import java.util.List;

import com.group4.erp.AdApplyDTO;
import com.group4.erp.CorporationDTO;
import com.group4.erp.EventDTO;
import com.group4.erp.EventSearchDTO;

public interface MarketingDAO {
	
	int getEventCnt(EventSearchDTO eventSearchDTO);
	
	int getEventAllCnt();
	
	List<EventDTO> getEventList(EventSearchDTO eventSearchDTO);
	
	int getAdApplyCnt();
	
	List<AdApplyDTO> getAdApplyList();
	
	int insertEvent(EventDTO eventDTO);
	
	List<CorporationDTO> getCorpList();
	
	int insertAd(AdApplyDTO adApplyDTO);


}
