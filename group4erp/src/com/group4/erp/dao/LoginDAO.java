package com.group4.erp.dao;

import java.util.Map;

//�α��� ���� �޼ҵ� �̸��� �����ϴ� 'DAO �������̽�' ����

public interface LoginDAO {
	//�α��� ���̵�, ��ȣ ���� ������ �˻��ϴ� �޼ҵ� ����
	
	int getEmpIdCnt(Map<String, String> emp_id_pwd);

}
