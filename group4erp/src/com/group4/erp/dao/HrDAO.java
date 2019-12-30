package com.group4.erp.dao;

import java.util.List;
import java.util.Map;
import org.springframework.stereotype.Repository;

import com.group4.erp.EmployeeDTO;
import com.group4.erp.EmployeeInfoDTO;
import com.group4.erp.SalaryDTO;
import com.group4.erp.TimeDTO;
import com.group4.erp.HrListSearchDTO;
import com.group4.erp.SalListSearchDTO;

public interface HrDAO {

	int getEmpListAllCnt(HrListSearchDTO hrListSearchDTO);
	
	int getEmpListAllCnt(SalListSearchDTO salListSearchDTO);
	
	List<SalaryDTO> getEmpSalList(SalListSearchDTO salListSearchDTO);
	
	List<Map<String, String>> getEmpList(HrListSearchDTO hrListSearchDTO);
	
	TimeDTO getTime();
	
	SalaryDTO getSalaryInfo(int emp_no);
	
	int getDayOffListCnt(HrListSearchDTO hrListSearchDTO);
	
	List<Map<String, String>> getDayOffList(HrListSearchDTO hrListSearchDTO);
	
	int getEmpInoutListCnt(HrListSearchDTO hrListSearchDTO);
	
	List<Map<String, String>> getEmpInoutList(HrListSearchDTO hrListSearchDTO);

	EmployeeInfoDTO getEmpContant(int emp_no);
	
	List<SalaryDTO> getAvgSalChart();
	
	int getNewEmpInsertCnt(EmployeeDTO employeeDTO);

}
