package com.group4.erp.dao;

import java.util.Map;

//로그인 관련 메소드 이름을 제공하는 'DAO 인터페이스' 선언

public interface LoginDAO {
	//로그인 아이디, 암호 존재 개수를 검색하는 메소드 선언
	
	int getAdminCnt(Map<String, String> admin_id_pwd);

}
