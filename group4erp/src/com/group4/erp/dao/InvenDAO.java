package com.group4.erp.dao;

import java.util.List;
import java.util.Map;

import com.group4.erp.*;



public interface InvenDAO {

	
	List<Map<String,String>> getBookList(InvenSearchDTO invenSearchDTO);

}
