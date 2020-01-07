package com.group4.erp.service;

import java.util.List;

import com.group4.erp.BestKwdDTO;

public interface AnalysisService {
	
	List<BestKwdDTO> getBestKwdList();
	
	List<BestKwdDTO> getKeywdSrchCntChart();

}
