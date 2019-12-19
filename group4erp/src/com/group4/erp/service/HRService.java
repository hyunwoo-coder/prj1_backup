package com.group4.erp.service;

import java.util.List;
import java.util.Map;

import com.group4.erp.EmployeeDTO;
import com.group4.erp.SalaryDTO;

public interface HRService {
	
	int getEmpAllCnt();
	
	
	List<SalaryDTO> getEmpSalList();

}
