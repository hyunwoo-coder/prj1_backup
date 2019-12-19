package com.group4.erp.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.group4.erp.EmployeeDTO;
import com.group4.erp.SalaryDTO;
import com.group4.erp.dao.HrDAO;

@Service
public class HRServiceImpl implements HRService {

	@Autowired
	HrDAO hrDAO;
	
	@Override
	public int getEmpAllCnt() {
		// TODO Auto-generated method stub
		return 0;
	}


	@Override
	public List<SalaryDTO> getEmpSalList() {
		// TODO Auto-generated method stub
		
		List<SalaryDTO> empSalList = this.hrDAO.getEmpSalList();
		System.out.println("getEmpSalList() 메소드 성공");
		
		return empSalList;
	}

}
