package com.group4.erp.dao;

import com.group4.erp.*;
import java.util.*;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class InvenDAOImpl implements InvenDAO{

   @Autowired
   private SqlSessionTemplate sqlSession;

	public List<Map<String,String>> getBookList(InvenSearchDTO invenSearchDTO){
		
		List<Map<String,String>> getBookList = this.sqlSession.selectList(
					"com.group4.erp.dao.invenSearchDAO.getBookList"
					,invenSearchDTO
				);
		
		return getBookList;
		
	}
	
	public int getBookListCnt(InvenSearchDTO invenSearchDTO) {
		
		int bookListCnt = this.sqlSession.selectOne(
				"com.group4.erp.dao.invenSearchDAO.getBookListCnt"
				,invenSearchDTO
				);
		
		return bookListCnt;
	}
	
	public List<Map<String, String>> getPublisher(InvenSearchDTO invenSearchDTO){
		
		List<Map<String, String>> publisher = this.sqlSession.selectList(
				"com.group4.erp.dao.invenSearchDAO.getPublisherList"
				,invenSearchDTO
				);
		
		return publisher;
	}

}
