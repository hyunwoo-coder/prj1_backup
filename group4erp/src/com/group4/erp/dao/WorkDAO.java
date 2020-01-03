package com.group4.erp.dao;

import java.util.List;
import java.util.Map;

import com.group4.erp.BusinessTripDTO;
import com.group4.erp.BusinessTripSearchDTO;



public interface WorkDAO {

	
	List<Map<String,String>> getbusinessList(BusinessTripSearchDTO businessTripSearchDTO);

	int getbusinessTripListAllCnt(BusinessTripSearchDTO businessTripSearchDTO);
	
	BusinessTripDTO getbusinessTripDTO(int work_outside_seq);
	
	//출장 신청
	int insertBusinessTrip(BusinessTripDTO businessTripDTO);
}
