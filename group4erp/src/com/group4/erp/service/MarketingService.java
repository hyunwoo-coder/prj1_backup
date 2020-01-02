package com.group4.erp.service;

import java.util.List;

import com.group4.erp.AdApplyDTO;
import com.group4.erp.CorporationDTO;
import com.group4.erp.EventDTO;
import com.group4.erp.EventSearchDTO;

public interface MarketingService {

	int getEventAllCnt();
	
	int getEventCnt(EventSearchDTO eventSearchDTO);
	
	List<EventDTO> getEventList(EventSearchDTO eventSearchDTO);
	
	int getAdApplyCnt();
	
	List<AdApplyDTO> getAdApplyList();
	
	int insertEvent(EventDTO eventDTO);
	
	List<CorporationDTO> getCorpList();
	
	int insertAd(AdApplyDTO adApplyDTO);
	
	int getOnlineOrderCnt();
	
	int deleteEvnt(String[] evnt_no);

}
