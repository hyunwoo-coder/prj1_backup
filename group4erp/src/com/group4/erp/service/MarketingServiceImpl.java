package com.group4.erp.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.group4.erp.EventDTO;
import com.group4.erp.dao.MarketingDAO;

@Service
public class MarketingServiceImpl implements MarketingService {
	
	@Autowired
	MarketingDAO marketingDAO;

	@Override
	public int getEventCnt() {
		// TODO Auto-generated method stub
		int eventCnt = this.marketingDAO.getEventCnt();
		
		return eventCnt;
	}

	@Override
	public List<EventDTO> getEventList() {
		// TODO Auto-generated method stub
		List<EventDTO> eventList = this.marketingDAO.getEventList();
		
		return eventList;
	}

}
