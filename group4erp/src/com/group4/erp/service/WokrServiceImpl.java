package com.group4.erp.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.group4.erp.BusinessTripDTO;
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

	public int getbusinessTripListAllCnt(BusinessTripSearchDTO businessTripSearchDTO) {
		
		int getbusinessTripListAllCnt = this.workDAO.getbusinessTripListAllCnt(businessTripSearchDTO);
		
		return getbusinessTripListAllCnt;
	}
	
	public BusinessTripDTO getbusinessTripDTO(int work_outside_seq) {

		//[BoardDAOImpl 객체]의 getBoardDTO 메소드를 호출하여 [1개 게시판 글]을 얻는다
		BusinessTripDTO businessTripDTO = this.workDAO.getbusinessTripDTO(work_outside_seq);
		
		//[1개 게시판 글]이 저장된 BoardDTO 객체 리턴하기
		return businessTripDTO;
	}
}
