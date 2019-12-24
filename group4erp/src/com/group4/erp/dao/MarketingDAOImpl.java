package com.group4.erp.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import com.group4.erp.EventDTO;

@Repository
public class MarketingDAOImpl implements MarketingDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	String mapper_namespace = "com.group4.erp.dao.MarketingDAO.";

	@Override
	public int getEventCnt() {
		// TODO Auto-generated method stub
		int eventCnt = this.sqlSession.selectOne(mapper_namespace+"getEventCnt");
		
		return eventCnt;
	}

	@Override
	public List<EventDTO> getEventList() {
		// TODO Auto-generated method stub
		List<EventDTO> eventList = this.sqlSession.selectList(mapper_namespace+"getEventList");
		
		return eventList;
	}

}
