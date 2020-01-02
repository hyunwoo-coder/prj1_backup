package com.group4.erp.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.group4.erp.AdApplyDTO;
import com.group4.erp.CorporationDTO;
import com.group4.erp.EventDTO;
import com.group4.erp.EventSearchDTO;

@Repository
public class MarketingDAOImpl implements MarketingDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	String mapper_namespace = "com.group4.erp.dao.MarketingDAO.";

	@Override
	public int getEventCnt(EventSearchDTO eventSearchDTO) {
		// TODO Auto-generated method stub
		int eventCnt = this.sqlSession.selectOne(mapper_namespace+"getEventCnt", eventSearchDTO);
		
		return eventCnt;
	}

	@Override
	public List<EventDTO> getEventList(EventSearchDTO eventSearchDTO) {
		// TODO Auto-generated method stub
		List<EventDTO> eventList = this.sqlSession.selectList(mapper_namespace+"getEventList", eventSearchDTO);
		
		return eventList;
	}

	@Override
	public int getAdApplyCnt() {
		// TODO Auto-generated method stub
		int ad_apply_cnt = this.sqlSession.selectOne(mapper_namespace+"getAdApplyCnt");
		
		return ad_apply_cnt;
	}

	@Override
	public List<AdApplyDTO> getAdApplyList() {
		// TODO Auto-generated method stub
		List<AdApplyDTO> ad_apply_list = this.sqlSession.selectList(mapper_namespace+"getAdApplyList");
		
		return ad_apply_list;
	}

	@Override
	public int insertEvent(EventDTO eventDTO) {
		// TODO Auto-generated method stub
		int eventCnt = this.sqlSession.insert(mapper_namespace+"insertEvent", eventDTO);
		
		return eventCnt;
	}

	@Override
	public int getEventAllCnt() {
		// TODO Auto-generated method stub
		int eventAllCnt = this.sqlSession.selectOne(mapper_namespace+"getEventAllCnt");
		
		return eventAllCnt;
	}

	@Override
	public List<CorporationDTO> getCorpList() {
		// TODO Auto-generated method stub
		List<CorporationDTO> corpList = this.sqlSession.selectList(mapper_namespace+"getCorpList");
		
		return corpList;
	}

	@Override
	public int insertAd(AdApplyDTO adApplyDTO) {
		// TODO Auto-generated method stub
		int insertAdCnt = this.sqlSession.insert(mapper_namespace+"insertAd", adApplyDTO);
		
		return insertAdCnt;
	}

	@Override
	public int getOnlineOrderCnt() {
		// TODO Auto-generated method stub
		int online_order_cnt = this.sqlSession.selectOne(mapper_namespace+"getOnlineOrderCnt");
		
		return online_order_cnt;
	}

	@Override
	public int deleteEvnt(String[] evnt_no) {
		// TODO Auto-generated method stub
		int deleteEvntCnt = this.sqlSession.delete(mapper_namespace+"deleteEvnt", evnt_no);
		
		return deleteEvntCnt;
	}

	@Override
	public int updateEvntState() {
		// TODO Auto-generated method stub
		int updateEvntCnt = this.sqlSession.update(mapper_namespace+"updateEvntState");
		
		return updateEvntCnt;
	}

}
