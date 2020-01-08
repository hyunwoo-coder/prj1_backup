package com.group4.erp.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.group4.erp.BestKwdDTO;
import com.group4.erp.BestKwdSearchDTO;
import com.group4.erp.dao.AnalysisDAO;

@Service
public class AnalysisServiceImpl implements AnalysisService {
	
	@Autowired
	AnalysisDAO analysisDAO;

	@Override
	public List<BestKwdDTO> getBestKwdList(BestKwdSearchDTO bestKwdSearchDTO) {
		// TODO Auto-generated method stub
		List<BestKwdDTO> bestKwdList = this.analysisDAO.getBestKwdList(bestKwdSearchDTO);
		
		return bestKwdList;
	}

	@Override
	public List<BestKwdDTO> getKeywdSrchCntChart() {
		// TODO Auto-generated method stub
		List<BestKwdDTO> bestKeywdInfo = this.analysisDAO.getKeywdSrchCntChart();
		
		return bestKeywdInfo;
	}

}
