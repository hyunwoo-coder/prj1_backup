package com.group4.erp.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import com.group4.erp.SalaryDTO;

@Repository
public class HrDAOImpl implements HrDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	String mapper_namespace = "com.group4.erp.HrDAO.";

	@Override
	public int getEmpAllCnt() {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<SalaryDTO> getEmpSalList() {
		// TODO Auto-generated method stub
		System.out.println("getEmpSalList() 메소드로 DB 연동 시작");
		List<SalaryDTO> empSalList = this.sqlSession.selectList(mapper_namespace + "getEmpSalList");
		System.out.println("getEmpSalList() 메소드로 DB 연동 끝");
		
		return empSalList;
	}

}
