package com.group4.erp.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import com.group4.erp.SalaryDTO;
import com.group4.erp.TimeDTO;
import com.group4.erp.EmployeeDTO;
import com.group4.erp.EmployeeInfoDTO;
import com.group4.erp.HrListSearchDTO;
import com.group4.erp.SalListSearchDTO;

@Repository
public class HrDAOImpl implements HrDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	String mapper_namespace = "com.group4.erp.dao.HrDAO.";

	@Override
	public List<SalaryDTO> getEmpSalList(SalListSearchDTO salListSearchDTO) {

		// TODO Auto-generated method stub

		System.out.println("getEmpSalList() 메소드 시작");
		List<SalaryDTO> empSalList = this.sqlSession.selectList(mapper_namespace + "getEmpSalList", salListSearchDTO);
		System.out.println("getEmpSalList() 메소드 끝");
		
		return empSalList;
	
	}
	
	
	public TimeDTO getTime() {
		// TODO Auto-generated method stub
		TimeDTO timeDTO = this.sqlSession.selectOne(mapper_namespace + "getTime");
		return timeDTO;
	}

	
	public int getEmpListAllCnt(HrListSearchDTO hrListSearchDTO) {
		
		int getEmpBoardListCnt = this.sqlSession.selectOne(
				mapper_namespace+"getEmpListCnt"
				,hrListSearchDTO
				);
		
		return getEmpBoardListCnt;
	}
	
	public List<Map<String, String>> getEmpList(HrListSearchDTO hrListSearchDTO){

		List<Map<String, String>> getEmpBoardList = this.sqlSession.selectList(
				"com.group4.erp.dao.HrDAO.getEmpList"
				,hrListSearchDTO
				);
		//System.out.println("DAO=>" + getEmpBoardList);
		return getEmpBoardList;

	}
	
	@Override
	public int getDayOffListCnt(HrListSearchDTO hrListSearchDTO) {
		int getDayOffListCnt = this.sqlSession.selectOne(
				"com.group4.erp.dao.HrDAO.getDayOffListCnt"
				,hrListSearchDTO
				);
		
		return getDayOffListCnt;
	}

	@Override
	public List<Map<String, String>> getDayOffList(HrListSearchDTO hrListSearchDTO) {
		List<Map<String, String>> getDayOffList = this.sqlSession.selectList(
				"com.group4.erp.dao.HrDAO.getDayOffList"
				,hrListSearchDTO
				);
		return getDayOffList;
	}

	@Override
	public int getEmpInoutListCnt(HrListSearchDTO hrListSearchDTO) {
		
		int getEmpInoutListCnt = this.sqlSession.selectOne(
				"com.group4.erp.dao.HrDAO.getEmpInoutListCnt"
				,hrListSearchDTO
				);
		
		return getEmpInoutListCnt;
	}

	@Override
	public List<Map<String, String>> getEmpInoutList(HrListSearchDTO hrListSearchDTO) {
		
		List<Map<String, String>> getEmpInoutList = this.sqlSession.selectList(
				"com.group4.erp.dao.HrDAO.getEmpInoutList"
				,hrListSearchDTO
				);
		
		return getEmpInoutList;
	}
	


	@Override
	public SalaryDTO getSalaryInfo(int emp_no) {
		// TODO Auto-generated method stub
		
		System.out.println("DAO getSalaryInfo() 메소드 실행");
		SalaryDTO salaryDTO = this.sqlSession.selectOne(mapper_namespace+"getEmpSalInfo", emp_no);
		
		return salaryDTO;
	}


	@Override
	public int getEmpListAllCnt(SalListSearchDTO salListSearchDTO) {
		// TODO Auto-generated method stub
		
		int getSalListCnt = this.sqlSession.selectOne(
				mapper_namespace+"getEmpListCnt"
				,salListSearchDTO
				);
		
		return getSalListCnt;
	
	}


	public EmployeeInfoDTO getEmpContant(int emp_no) {
		
		EmployeeInfoDTO getEmpContantList = this.sqlSession.selectOne(
				mapper_namespace+"getEmpContantList"
				,emp_no
				);
		
		return getEmpContantList;
		
	}


	@Override
	public List<SalaryDTO> getAvgSalChart() {
		// TODO Auto-generated method stub
		List<SalaryDTO> avgSalInfo = this.sqlSession.selectList(mapper_namespace+"getAvgSalChart");
		
		return avgSalInfo;
	}
	
	public int getNewEmpInsertCnt(EmployeeDTO employeeDTO) {
		
		int newEmpInsertCnt = this.sqlSession.insert(
				mapper_namespace+"getNewEmpInsert"
				,employeeDTO
				);
				
		return newEmpInsertCnt;
	}

}
