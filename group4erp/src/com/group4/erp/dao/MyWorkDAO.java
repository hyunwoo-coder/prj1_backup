package com.group4.erp.dao;

import java.util.List;
import java.util.Map;

import com.group4.erp.*;



public interface MyWorkDAO {

	
	List<Map<String,String>> getMyCareBookList(MyCareBookListDTO myCareBookListDTO);

}
