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

	//===================================================================================================
	//검색 항목 불러오는 코드
	public List<Map<String,String>> getMyCareBookList(MyWorkSearchDTO myWorkSearchDTO){
		
		List<Map<String,String>> getMyCareBookList = this.sqlSession.selectList(
					"com.group4.erp.dao.myWorkDAO.getMyCareBookList"
					,myWorkSearchDTO
				);
		//System.out.println("DAO : " + getMyCareBookList.size());
		return getMyCareBookList;
		
	}
	public List<Map<String,String>> getCategoryList(MyWorkSearchDTO myWorkSearchDTO){
		
		List<Map<String,String>> getCategoryList = this.sqlSession.selectList(
					"com.group4.erp.dao.myWorkDAO.getCategoryList"
					,myWorkSearchDTO
				);
		//System.out.println("DAO : " + getCategoryList.size());
		return getCategoryList;
		
	}
	public List<Map<String,String>> getBookSizeList(MyWorkSearchDTO myWorkSearchDTO){
		
		List<Map<String,String>> getBookSizeList = this.sqlSession.selectList(
					"com.group4.erp.dao.myWorkDAO.getBookSizeList"
					,myWorkSearchDTO
				);
		//System.out.println("DAO : " + getBookSizeList.size());
		return getBookSizeList;
		
	}
	public List<Map<String,String>> getBranchList(MyWorkSearchDTO myWorkSearchDTO){
		
		List<Map<String,String>> getBranchList = this.sqlSession.selectList(
					"com.group4.erp.dao.myWorkDAO.getBranchList"
					,myWorkSearchDTO
				);
		//System.out.println("DAO : " + getBranchList.size());
		return getBranchList;
		
	}
	public List<Map<String,String>> getPublisherList(MyWorkSearchDTO myWorkSearchDTO){
		
		List<Map<String,String>> getPublisherList = this.sqlSession.selectList(
					"com.group4.erp.dao.myWorkDAO.getPublisherList"
					,myWorkSearchDTO
				);
		//System.out.println("DAO : " + getPublisherList.size());
		return getPublisherList;
		
	}
	//===================================================================================================
	//페이징 처리를 위한 총 검색 개수 불러오는 코드
	public int getMyWorkListAllCnt(MyWorkSearchDTO myWorkSearchDTO){
		
		int myWorkListAllCnt = this.sqlSession.selectOne(
					"com.group4.erp.dao.myWorkDAO.getMyWorkListAllCnt"
					,myWorkSearchDTO
				);
		System.out.println("DAO : " + myWorkListAllCnt);
		return myWorkListAllCnt;
		
	}
}
