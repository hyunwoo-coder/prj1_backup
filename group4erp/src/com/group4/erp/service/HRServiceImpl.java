package com.group4.erp.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.group4.erp.HrListSearchDTO;
import com.group4.erp.dao.HrDAO;
import com.group4.erp.dao.InvenDAO;

@Service
@Transactional
public class HRServiceImpl implements HRService {
	
	@Autowired
	private HrDAO hrDAO;
	
	public int getEmpListAllCnt(HrListSearchDTO hrListSearchDTO) {
		
		int getEmpBoardListCnt = this.hrDAO.getEmpListAllCnt(hrListSearchDTO);
		
		return getEmpBoardListCnt;
	}
	
	public List<Map<String, String>> getEmpList(HrListSearchDTO hrListSearchDTO){
		
		List<Map<String, String>> getEmpBoardList = this.hrDAO.getEmpList(hrListSearchDTO);
		
		return getEmpBoardList;
	}

}
