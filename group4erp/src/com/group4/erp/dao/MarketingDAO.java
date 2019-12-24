package com.group4.erp.dao;

import java.util.List;
import com.group4.erp.EventDTO;

public interface MarketingDAO {
	
	int getEventCnt();
	
	List<EventDTO> getEventList();
	
	int getAdApplyCnt();


}
