package com.group4.erp.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.group4.erp.BusinessTripSearchDTO;

@Repository
public class WorkDAOImpl implements WorkDAO{

	@Autowired
	private SqlSessionTemplate sqlSession;

	public List<Map<String,String>> getbusinessList(BusinessTripSearchDTO businessTripSearchDTO){
		
		List<Map<String,String>> getbusinessList = this.sqlSession.selectList(
					"com.group4.erp.dao.WorkDAO.getBusinessTripList"
					,businessTripSearchDTO
				);
		
		return getbusinessList;
		
	}
}
