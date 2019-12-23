package com.group4.erp.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.group4.erp.BusinessTripSearchDTO;
import com.group4.erp.dao.WorkDAO;

@Service
public class WokrServiceImpl implements WorkService {

	@Autowired
	WorkDAO workDAO;

	@Override
	public List<Map<String, String>> getbusinessTripList(BusinessTripSearchDTO businessTripSearchDTO){
		
		List<Map<String, String>> getbusinessTripList = this.workDAO.getbusinessList(businessTripSearchDTO);
		
		return getbusinessTripList;

	}


}
