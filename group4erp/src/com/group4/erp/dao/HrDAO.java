package com.group4.erp.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.group4.erp.EmployeeDTO;
import com.group4.erp.SalaryDTO;

public interface HrDAO {
	
	int getEmpAllCnt();
	
	List<SalaryDTO> getEmpSalList();

}
