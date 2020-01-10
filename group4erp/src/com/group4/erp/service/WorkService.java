package com.group4.erp.service;
import java.util.List;
import java.util.Map;

import com.group4.erp.BusinessTripDTO;
import com.group4.erp.BusinessTripSearchDTO;


public interface WorkService {
	
	//출장 리스트
	List<Map<String, String>> getbusinessTripList(BusinessTripSearchDTO businessTripSearchDTO);
	
	//출장 리스트 총개수
	int getbusinessTripListAllCnt(BusinessTripSearchDTO businessTripSearchDTO);
	
	//출장 1개 상세
	BusinessTripDTO getBusinessTripDTO(int work_outside_seq);
	
	//출장 신청
	int insertBusinessTrip(BusinessTripDTO businessTripDTO);
	//출장 수정
	int updateBusinessTrip(BusinessTripDTO businessTripDTO);
	//출장 삭제
	int deleteBusinessTrip(BusinessTripDTO businessTripDTO);
	//출장 승인
	int approvedBusinessTrip(BusinessTripDTO businessTripDTO);
}
