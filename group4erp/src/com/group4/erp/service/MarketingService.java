package com.group4.erp.service;

import java.util.List;
import com.group4.erp.EventDTO;

public interface MarketingService {
	
	int getEventCnt();
	
	List<EventDTO> getEventList();
	
	int getAdApplyCnt();

}
