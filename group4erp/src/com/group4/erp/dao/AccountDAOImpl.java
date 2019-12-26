package com.group4.erp.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.group4.erp.CorpOrderDTO;
import com.group4.erp.CorpSearchDTO;
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
	public List<CorporationDTO> getCorpList(CorpSearchDTO corpSearchDTO) {
		// TODO Auto-generated method stub
		
		List<CorporationDTO> corpList = this.sqlSession.selectList(mapper_namespace+"getCorpList", corpSearchDTO);
		
		return corpList;
	}
	
	public int insertCorp(CorporationDTO corporationDTO) {
		
		int insertCorpCnt = this.sqlSession.insert(mapper_namespace+"insertCorp", corporationDTO);
		
		return insertCorpCnt;
	}

	@Override
	public CorporationDTO getCorpInfo(String corp_no) {
		
		CorporationDTO selectedCorp = this.sqlSession.selectOne(mapper_namespace+"getCorpInfo", corp_no);
		// TODO Auto-generated method stub
		return selectedCorp;
	}

	@Override
	public int getCorpOrderCnt() {
		// TODO Auto-generated method stub
		int corp_order_cnt = this.sqlSession.selectOne(mapper_namespace+"getCorpOrderCnt");
		
		return corp_order_cnt;
	}

	@Override
	public List<CorpOrderDTO> getCorpOrderList() {
		// TODO Auto-generated method stub
		List<CorpOrderDTO> corp_order_list = this.sqlSession.selectList(mapper_namespace+"getCorpOrderList");
		
		return corp_order_list;
	}

}
