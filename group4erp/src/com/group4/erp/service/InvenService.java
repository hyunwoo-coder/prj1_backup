package com.group4.erp.service;
import com.group4.erp.InvenSearchDTO;
import java.util.*;

public interface InvenService {

	List<Map<String,String>> getBookList(InvenSearchDTO invenSearchDTO);
}
