package com.group4.erp.dao;

import java.util.List;
import java.util.Map;

import com.group4.erp.BusinessTripSearchDTO;



public interface WorkDAO {

	
	List<Map<String,String>> getbusinessList(BusinessTripSearchDTO businessTripSearchDTO);

}
