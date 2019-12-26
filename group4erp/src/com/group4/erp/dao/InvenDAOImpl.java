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
	
	public List<Map<String, String>> getInvenLoc(InvenSearchDTO invenSearchDTO){
		
		List<Map<String,String>> getInventory_loc = this.sqlSession.selectList(
				"com.group4.erp.dao.invenSearchDAO.getInven_loc"
				,invenSearchDTO
			);
		
		return getInventory_loc;
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
	
	public int getReleaseListCnt(InvenSearchDTO invenSearchDTO) {
		
		int releaseListCnt = this.sqlSession.selectOne(
				"com.group4.erp.dao.invenSearchDAO.getReleaseListCnt"
				,invenSearchDTO
				);
		
		return releaseListCnt;
	}
	
	public List<Map<String,String>> getReleaseList(InvenSearchDTO invenSearchDTO){
		
		List<Map<String,String>> getReleaseList = this.sqlSession.selectList(
				"com.group4.erp.dao.invenSearchDAO.getReleaseList"
				,invenSearchDTO
			);
	
		return getReleaseList;
	}
	
	public Cus_releaseInfoDTO getReleaseCusInfo(int all_order_no) {

		Cus_releaseInfoDTO cus_order = this.sqlSession.selectOne(
				"com.group4.erp.dao.invenSearchDAO.getReleaseCusInfo"
				,all_order_no);
		
		return cus_order;
	}
	
	public Cus_releaseInfoDTO getReleaseCorpInfo(int all_order_no) {

		Cus_releaseInfoDTO corp_order = this.sqlSession.selectOne(
				"com.group4.erp.dao.invenSearchDAO.getReleaseCorpInfo"
				,all_order_no);
		
		return corp_order;
	}

}
