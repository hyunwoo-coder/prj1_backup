package com.group4.erp.service;

import com.group4.erp.InvenSearchDTO;
import com.group4.erp.MyCareBookListDTO;
import com.group4.erp.dao.*;
import java.util.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class MyWorkServiceImpl implements MyWorkService{

	@Autowired
	private MyWorkDAO myWorkDAO;

	public List<Map<String,String>> getMyCareBookList(MyCareBookListDTO myCareBookListDTO) {

		List<Map<String,String>> getMyCareBookList = this.myWorkDAO.getMyCareBookList(myCareBookListDTO);

		//System.out.println("서비스 : " + getMyCareBookList.size());
		return getMyCareBookList;
		
	}
}
