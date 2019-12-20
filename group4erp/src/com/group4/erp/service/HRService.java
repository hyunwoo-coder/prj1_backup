package com.group4.erp.service;

import java.util.List;
import java.util.Map;
import com.group4.erp.EmployeeDTO;
import com.group4.erp.SalaryDTO;
import com.group4.erp.TimeDTO;
import com.group4.erp.HrListSearchDTO;
import com.group4.erp.SalListSearchDTO;


public interface HRService {
	
	int getEmpListAllCnt(HrListSearchDTO hrListSearchDTO);
	
	int getEmpListAllCnt(SalListSearchDTO salListSearchDTO);
	
	List<SalaryDTO> getEmpSalList();

	List<Map<String, String>> getEmpList(HrListSearchDTO hrListSearchDTO);
	
	TimeDTO getTime();
	
	SalaryDTO getSalaryInfo(int emp_no);
	int getDayOffListCnt (HrListSearchDTO hrListSearchDTO);
	
	List<Map<String, String>> getDayOffList(HrListSearchDTO hrListSearchDTO);
	
	int getEmpInoutListCnt(HrListSearchDTO hrListSearchDTO);
	
	List<Map<String, String>> getEmpInoutList(HrListSearchDTO hrListSearchDTO);

}
