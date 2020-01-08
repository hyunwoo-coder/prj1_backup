package com.group4.erp.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.group4.erp.BestKwdDTO;
import com.group4.erp.BestKwdSearchDTO;

@Repository
public class AnalysisDAOImpl implements AnalysisDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	String mapper_namespace = "com.group4.erp.dao.AnalysisDAO.";

	@Override
	public List<BestKwdDTO> getBestKwdList(BestKwdSearchDTO bestKwdSearchDTO) {
		// TODO Auto-generated method stub
		
		List<BestKwdDTO> bestKwdList = this.sqlSession.selectList(mapper_namespace+"getBestKwdList", bestKwdSearchDTO);
		
		return bestKwdList;
	}

	@Override
	public List<BestKwdDTO> getKeywdSrchCntChart() {
		// TODO Auto-generated method stub
		List<BestKwdDTO> bestKeywdInfo = this.sqlSession.selectList(mapper_namespace+"getKeywdSrchCntChart");
		
		return bestKeywdInfo;
	}

}
