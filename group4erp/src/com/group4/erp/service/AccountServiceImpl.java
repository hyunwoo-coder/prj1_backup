package com.group4.erp.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.group4.erp.CorporationDTO;
import com.group4.erp.dao.AccountDAO;

@Service
public class AccountServiceImpl implements AccountService {
	
	@Autowired
	AccountDAO accountDAO;

	@Override
	public int getCorpListCnt() {
		// TODO Auto-generated method stub
		int corpListCnt = this.accountDAO.getCorpListCnt();
		
		return corpListCnt;
	}

	@Override
	public List<CorporationDTO> getCorpList() {
		// TODO Auto-generated method stub
		List<CorporationDTO> corpList = this.accountDAO.getCorpList();
		
		return corpList;
	}
	
	

}
