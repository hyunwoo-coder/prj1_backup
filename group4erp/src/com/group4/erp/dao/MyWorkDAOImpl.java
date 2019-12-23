package com.group4.erp.dao;

import com.group4.erp.*;
import java.util.*;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MyWorkDAOImpl implements MyWorkDAO{

	@Autowired
	private SqlSessionTemplate sqlSession;

	public List<Map<String,String>> getMyCareBookList(MyCareBookListDTO myCareBookListDTO){
		
		List<Map<String,String>> getMyCareBookList = this.sqlSession.selectList(
					"com.group4.erp.dao.myWorkDAO.getMyCareBookList"
					,myCareBookListDTO
				);
		//System.out.println("DAO : " + getMyCareBookList.size());
		return getMyCareBookList;
		
	}
}
