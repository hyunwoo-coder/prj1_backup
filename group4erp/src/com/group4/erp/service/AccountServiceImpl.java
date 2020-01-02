package com.group4.erp.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.group4.erp.CorpOrderDTO;
import com.group4.erp.CorpSearchDTO;
import com.group4.erp.CorporationDTO;
import com.group4.erp.TranSpecDTO;
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
	public List<CorporationDTO> getCorpList(CorpSearchDTO corpSearchDTO) {
		// TODO Auto-generated method stub
		List<CorporationDTO> corpList = this.accountDAO.getCorpList(corpSearchDTO);
		
		return corpList;
	}

	@Override
	public int insertCorp(CorporationDTO corporationDTO) {
		// TODO Auto-generated method stub.
		
		int insertCorpCnt = this.accountDAO.insertCorp(corporationDTO);
		
		return insertCorpCnt;
	}

	@Override
	public CorporationDTO getCorpInfo(String corp_no) {
		// TODO Auto-generated method stub
		CorporationDTO selectedCorp = this.accountDAO.getCorpInfo(corp_no);
		
		return selectedCorp;
	}

	@Override
	public int getCorpOrderCnt(CorpSearchDTO corpSearchDTO) {
		// TODO Auto-generated method stub
		int corp_order_cnt = this.accountDAO.getCorpOrderCnt(corpSearchDTO);
		
		return corp_order_cnt;
	}

	@Override
	public List<CorpOrderDTO> getCorpOrderList(CorpSearchDTO corpSearchDTO) {
		// TODO Auto-generated method stub
		List<CorpOrderDTO> corp_order_list = this.accountDAO.getCorpOrderList(corpSearchDTO);
		
		return corp_order_list;
	}

	@Override
	public CorporationDTO selectCorp(String corp_no) {
		// TODO Auto-generated method stub
		CorporationDTO selectedCorp = this.accountDAO.selectCorp(corp_no);
		
		return selectedCorp;
	}

	@Override
	public int getTranSpecCnt(int order_no) {
		// TODO Auto-generated method stub
		int tranSpecCnt = this.accountDAO.getTranSpecCnt(order_no); 
		
		return tranSpecCnt;
	}

	@Override
	public List<TranSpecDTO> getTranSpecList(int order_no) {
		// TODO Auto-generated method stub
		List<TranSpecDTO> tranSpecList = this.accountDAO.getTranSpecList(order_no);
		
		return tranSpecList;
	}

	@Override
	public int deleteCorp(String[] corp_no) {
		// TODO Auto-generated method stub
		int delCnt = this.accountDAO.deleteCorp(corp_no);
		
		return delCnt;
	}
	
	

}
