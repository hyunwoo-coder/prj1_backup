package com.group4.erp.dao;

import java.util.List;

import com.group4.erp.BestKwdDTO;

public interface AnalysisDAO {

	List<BestKwdDTO> getBestKwdList();
	
	List<BestKwdDTO> getKeywdSrchCntChart();
	
}
