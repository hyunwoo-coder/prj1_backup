package com.group4.erp.service;

import java.util.List;

import com.group4.erp.BestKwdDTO;
import com.group4.erp.BestKwdSearchDTO;

public interface AnalysisService {
	
	List<BestKwdDTO> getBestKwdList(BestKwdSearchDTO bestKwdSearchDTO);
	
	List<BestKwdDTO> getKeywdSrchCntChart();
	
	List<BestKwdDTO> getBestKwdListChart(BestKwdSearchDTO bestKwdSearchDTO);

}
