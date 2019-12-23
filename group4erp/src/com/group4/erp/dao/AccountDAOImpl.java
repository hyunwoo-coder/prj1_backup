package com.group4.erp.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.group4.erp.CorporationDTO;

@Repository
public class AccountDAOImpl implements AccountDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	String mapper_namespace = "com.group4.erp.dao.AccountDAO.";

	@Override
	public int getCorpListCnt() {
		// TODO Auto-generated method stub
		
		int corpListCnt = this.sqlSession.selectOne(mapper_namespace+"getCorpListCnt");
		
		return corpListCnt;
	}

	@Override
	public List<CorporationDTO> getCorpList() {
		// TODO Auto-generated method stub
		
		List<CorporationDTO> corpList = this.sqlSession.selectList(mapper_namespace+"getCorpList");
		
		return corpList;
	}

}
