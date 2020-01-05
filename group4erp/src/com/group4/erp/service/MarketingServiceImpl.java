package com.group4.erp.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.group4.erp.AdApplyDTO;
import com.group4.erp.CorporationDTO;
import com.group4.erp.EventDTO;
import com.group4.erp.EventSearchDTO;
import com.group4.erp.OrderDTO;
import com.group4.erp.dao.MarketingDAO;

@Service
public class MarketingServiceImpl implements MarketingService {
	
	@Autowired
	MarketingDAO marketingDAO;

	@Override
	public int getEventCnt(EventSearchDTO eventSearchDTO) {
		// TODO Auto-generated method stub
		int eventCnt = this.marketingDAO.getEventCnt(eventSearchDTO);
		
		return eventCnt;
	}

	@Override
	public List<EventDTO> getEventList(EventSearchDTO eventSearchDTO) {
		// TODO Auto-generated method stub
		List<EventDTO> eventList = this.marketingDAO.getEventList(eventSearchDTO);
		
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

	@Override
	public int insertEvent(EventDTO eventDTO) {
		// TODO Auto-generated method stub
		int eventCnt = this.marketingDAO.insertEvent(eventDTO);
		
		return eventCnt;
	}

	@Override
	public int getEventAllCnt() {
		// TODO Auto-generated method stub
		int eventAllCnt = this.marketingDAO.getEventAllCnt();
		
		return eventAllCnt;
	}

	@Override
	public List<CorporationDTO> getCorpList() {
		// TODO Auto-generated method stub
		List<CorporationDTO> corpList = this.marketingDAO.getCorpList();
		
		return corpList;
	}

	@Override
	public int insertAd(AdApplyDTO adApplyDTO) {
		// TODO Auto-generated method stub
		int insertAdCnt = this.marketingDAO.insertAd(adApplyDTO);
		
		return insertAdCnt;
	}

	@Override
	public int getOnlineOrderCnt() {
		// TODO Auto-generated method stub
		int online_order_cnt = this.marketingDAO.getOnlineOrderCnt();
		
		return online_order_cnt;
	}

	@Override
	public int deleteEvnt(String[] evnt_no) {
		// TODO Auto-generated method stub
		int deleteEvntCnt = this.marketingDAO.deleteEvnt(evnt_no);
		
		return deleteEvntCnt;
	}

	@Override
	public int updateEvntState() {
		// TODO Auto-generated method stub
		int updateEvntCnt = this.marketingDAO.updateEvntState();
		
		return updateEvntCnt;
	}

	@Override
	public List<OrderDTO> getOnlineOrderList() {
		// TODO Auto-generated method stub
		List<OrderDTO> onlineOrderList = this.marketingDAO.getOnlineOrderList();
		
		return onlineOrderList;
	}

	@Override
	public int getTotRevenue() {
		// TODO Auto-generated method stub
		int tot_revenue = this.marketingDAO.getTotRevenue();
		
		return tot_revenue;
	}
	
	

}
