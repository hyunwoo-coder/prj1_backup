package com.group4.erp.service;

import java.util.List;
import java.util.Map;

import com.group4.erp.HrListSearchDTO;

public interface HRService {
	
	int getEmpListAllCnt(HrListSearchDTO hrListSearchDTO);
	
	List<Map<String, String>> getEmpList(HrListSearchDTO hrListSearchDTO);

}
