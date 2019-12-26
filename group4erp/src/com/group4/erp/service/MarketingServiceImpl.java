package com.group4.erp.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.group4.erp.AdApplyDTO;
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

	@Override
	public int getAdApplyCnt() {
		// TODO Auto-generated method stub
		int ad_apply_cnt = this.marketingDAO.getAdApplyCnt();
		
		return ad_apply_cnt;
	}

	@Override
	public List<AdApplyDTO> getAdApplyList() {
		// TODO Auto-generated method stub
		List<AdApplyDTO> ad_apply_list = this.marketingDAO.getAdApplyList();
		
		return ad_apply_list;
	}
	
	

}
