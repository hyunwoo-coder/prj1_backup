package com.group4.erp.dao;

import java.util.List;
import java.util.Map;
import org.springframework.stereotype.Repository;

import com.group4.erp.EmployeeDTO;
import com.group4.erp.EmployeeInfoDTO;
import com.group4.erp.EmployeeInfoUpDTO;
import com.group4.erp.HrDayoffDTO;
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
	
	List<SalaryDTO> getSalaryInfo(int emp_no);
	
	int getDayOffListCnt(HrListSearchDTO hrListSearchDTO);
	
	List<Map<String, String>> getDayOffList(HrListSearchDTO hrListSearchDTO);
	
	int getEmpInoutListCnt(HrListSearchDTO hrListSearchDTO);
	
	List<Map<String, String>> getEmpInoutList(HrListSearchDTO hrListSearchDTO);

	EmployeeInfoUpDTO getEmpContant(int emp_no);
	
	int empInfoUpProc(EmployeeInfoUpDTO employeeInfoUpDTO);
	
	List<SalaryDTO> getAvgSalChart();
	
	int getNewEmpInsertCnt(EmployeeDTO employeeDTO);

	//String getMgrEmpName(EmployeeDTO employeeDTO);
	
	int getAddDayoffinfoCnt(EmployeeDTO employeeDTO);
	
	int dayoffUpdateProcI(HrDayoffDTO hrDayoffDTO);
	
	int dayoffUpdateProcII(HrDayoffDTO hrDayoffDTO);

	int dayoffUpdateProc(HrDayoffDTO hrDayoffDTO);
	
	int getUpdateCnt(Map<String, String> emp_no_in_time_out_time_check_inout_name_remarks);
	
	int getMyPayCheckCnt(int emp_no);


}
