package com.group4.erp.service;
import java.util.List;
import java.util.Map;

import com.group4.erp.BusinessTripSearchDTO;


public interface WorkService {
	

	List<Map<String, String>> getbusinessTripList(BusinessTripSearchDTO businessTripSearchDTO);
	
}
