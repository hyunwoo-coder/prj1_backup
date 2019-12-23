package com.group4.erp.service;
import com.group4.erp.InvenSearchDTO;
import com.group4.erp.MyCareBookListDTO;

import java.util.*;

public interface MyWorkService {

	List<Map<String,String>> getMyCareBookList(MyCareBookListDTO myCareBookListDTO);
}
