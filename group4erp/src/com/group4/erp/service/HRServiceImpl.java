package com.group4.erp.service;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.group4.erp.EmployeeDTO;
import com.group4.erp.SalaryDTO;
import com.group4.erp.TimeDTO;
import com.group4.erp.dao.HrDAO;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.group4.erp.HrListSearchDTO;
import com.group4.erp.dao.HrDAO;
import com.group4.erp.dao.InvenDAO;

@Service
public class HRServiceImpl implements HRService {

	@Autowired
	HrDAO hrDAO;

	@Override
	public List<SalaryDTO> getEmpSalList() {
		
		List<SalaryDTO> empSalList = this.hrDAO.getEmpSalList();
		
		return empSalList;
	}
	
	public int getEmpListAllCnt(HrListSearchDTO hrListSearchDTO) {
		
		int getEmpBoardListCnt = this.hrDAO.getEmpListAllCnt(hrListSearchDTO);
		
		return getEmpBoardListCnt;
	}
	
	public List<Map<String, String>> getEmpList(HrListSearchDTO hrListSearchDTO){
		
		List<Map<String, String>> getEmpBoardList = this.hrDAO.getEmpList(hrListSearchDTO);
		
		return getEmpBoardList;

	}

	@Override
	public TimeDTO getTime() {
		// TODO Auto-generated method stub
		TimeDTO timeDTO = this.hrDAO.getTime();
		
		return timeDTO;
	}

}
