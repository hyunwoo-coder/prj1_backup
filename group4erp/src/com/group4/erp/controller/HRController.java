package com.group4.erp.controller;

import java.sql.Array;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import com.group4.erp.service.HRService;

import com.group4.erp.*;
import com.group4.erp.service.InvenService;

@Controller
public class HRController {
	
	@Autowired
	HRService hrservice;
	
	@RequestMapping(value="/viewEmpList.do")
	public ModelAndView viewEmpListList(
			HttpSession session
			,HrListSearchDTO hrListSearchDTO
			) {
		
		ModelAndView mav = new ModelAndView();
		//mav.setViewName("eventScheduleForm.jsp");
		
		mav.setViewName("main.jsp");
		mav.addObject("subMenu", "viewEmpList");
		mav.addObject("navigator", "[인사관리]-[직원정보]");
		
		try {
			
			int getEmpBoardListCnt = this.hrservice.getEmpListAllCnt(hrListSearchDTO);
			mav.addObject("getEmpBoardListCnt", getEmpBoardListCnt);

			if(getEmpBoardListCnt>0) {
				//선택한 페이지 번호 구하기
				int selectPageNo = hrListSearchDTO.getSelectPageNo();
				//한 화면에 보여지는 행의 개수 구하기
				int rowCntPerPage = hrListSearchDTO.getRowCntPerPage();
				//검색할 시작행 번호 구하기
				int beginRowNo = (selectPageNo*rowCntPerPage-rowCntPerPage+1);
				//만약 검색한 총 개수가 검색할 시작행 번호보다 작으면 선택한페이지 번호를 1로 세팅하기
				if(getEmpBoardListCnt<beginRowNo) hrListSearchDTO.setSelectPageNo(1);
			}
			
			List<Map<String, String>> getEmpBoardList = this.hrservice.getEmpList(hrListSearchDTO);
			mav.addObject("getEmpBoardList", getEmpBoardList);
			mav.addObject("hrListSearchDTO", hrListSearchDTO);

		}catch(Exception e) {
			System.out.println("<직원 리스트 조회 실패>");
			System.out.println("예외발생=>"+e);
		}
		
		return mav;
	}
	
	
	@RequestMapping(value="/viewSalList.do")
	public ModelAndView viewSalList(HttpSession session, SalListSearchDTO salListSearchDTO) {
		
		int sikdae = 10;
		int car_care = 10;

		float health_care = (float) 0.0323;
		double emp_insurance = 0.08d;
		double annuity = 0.045d;
		double residence = 0.1d;
		double income = 0.027d;
		
		ModelAndView mav = new ModelAndView();
		//mav.setViewName("eventScheduleForm.jsp");

		try {
			TimeDTO timeDTO = this.hrservice.getTime();

			int emp_tot_cnt = this.hrservice.getEmpListAllCnt(salListSearchDTO);
			
			System.out.println("emp_tot_cnt=="+emp_tot_cnt);
			
			List<SalaryDTO> empSalList = this.hrservice.getEmpSalList(salListSearchDTO);
			
			if(emp_tot_cnt >0 ) {
				int selectPageNo = salListSearchDTO.getSelectPageNo();	//선택한 페이지 번호 구하기
				int rowCntPerPage = salListSearchDTO.getRowCntPerPage();	//한 화면에 보여지는 행의 개수 구하기
				int beginRowNo = selectPageNo * rowCntPerPage - rowCntPerPage +1;	//검색할 시작행 번호 구하기
				if(emp_tot_cnt < beginRowNo) {		//만약 검색한 총 개수가 검색할 시작행 번호보다 작으면 선택한 페이지 번호를 1로 지정
					salListSearchDTO.setSelectPageNo(1);
				}
			}
			
			double real_sal = 0.0d;
			double deduct_sal = 0.0d;
			double final_sal = 0.0d;
			
			for(int i=0; i<empSalList.size(); i++) {
				
				double income_sal = Math.round(  ( (empSalList.get(i).getSalary() ) * income) * 1000 ) / 1000.0 ;
				double health_care_sal = Math.round(empSalList.get(i).getSalary() * health_care * 1000) / 1000.0 ;
				double emp_insur_sal = Math.round(empSalList.get(i).getSalary() * emp_insurance *1000) / 1000.0;
				double annuity_sal = Math.round(empSalList.get(i).getSalary() * annuity * 1000) / 1000.0;
				double resident_sal = Math.round( ( (empSalList.get(i).getSalary() * income) * residence ) * 1000) / 1000.0;
				
				real_sal = empSalList.get(i).getSalary() + sikdae + car_care;

				empSalList.get(i).setReal_sal(real_sal);
				empSalList.get(i).setIncome(income_sal);			//소득세
				empSalList.get(i).setHealth_care(health_care_sal);	//건강보험료
				empSalList.get(i).setEmp_insurance(emp_insur_sal);	//고용보험료
				empSalList.get(i).setAnnuity(annuity_sal);			//국민연금보험료
				empSalList.get(i).setResident(resident_sal);		//주민세
				empSalList.get(i).setIncome(income_sal);//�ҵ漼
				empSalList.get(i).setHealth_care(health_care_sal);	//�ǰ������
				empSalList.get(i).setEmp_insurance(emp_insur_sal);	//��뺸���
				empSalList.get(i).setAnnuity(annuity_sal);	//���ο���
				empSalList.get(i).setResident(resident_sal);	//�ֹμ�


				empSalList.get(i).setReal_sal(real_sal);
				empSalList.get(i).setIncome(income_sal);//�ҵ漼
				empSalList.get(i).setHealth_care(health_care_sal);	//�ǰ������
				empSalList.get(i).setEmp_insurance(emp_insur_sal);	//��뺸���
				empSalList.get(i).setAnnuity(annuity_sal);	//���ο���
				empSalList.get(i).setResident(resident_sal);	//�ֹμ�

				deduct_sal = (float) (income_sal + health_care_sal + emp_insur_sal + annuity_sal + resident_sal );
				empSalList.get(i).setDeduct_sal(Math.round(deduct_sal*1000)/1000.0);
				final_sal = real_sal - deduct_sal;
				empSalList.get(i).setFinal_sal(Math.round(final_sal*1000)/1000.0);
								
			}
			
			mav.setViewName("main.jsp");
			mav.addObject("salListSearchDTO", salListSearchDTO);
			mav.addObject("timeDTO", timeDTO);
			mav.addObject("empSalList", empSalList);
			mav.addObject("sikdae", sikdae);
			mav.addObject("car_care", car_care);
			mav.addObject("emp_tot_cnt", emp_tot_cnt);
			mav.addObject("subMenu", "viewSalList");
			mav.addObject("navigator", "[인사관리]-[급여지급현황]");
			
		} catch(Exception e) {
			System.out.println("예외발생=="+e);
		}
				
		return mav;
	}
	
	//급여명세서(개인별) 조회 기능
	@RequestMapping(value="/viewEmpSalInfo.do")
	public ModelAndView viewEmpSalInfo(HttpSession session) {
		
		ModelAndView mav = new ModelAndView();
		
		int emp_no = 1;
		
		TimeDTO timeDTO = this.hrservice.getTime();
	
		System.out.println("급여 컨트롤러 시작");
		SalaryDTO salaryDTO = this.hrservice.getSalaryInfo(1);
		System.out.println("컨트롤러 급여명세서 조회 성공");
		
		mav.setViewName("main.jsp");
		mav.addObject("subMenu", "viewEmpSalInfo");
		mav.addObject("salaryDTO", salaryDTO);
		mav.addObject("timeDTO", timeDTO);
		
		return mav;
	}
	
	
	//직급별 평균 연봉을 막대 차트로 보여준다.
	@RequestMapping(value="/viewEmpAvgSalChart.do")
	public ModelAndView viewEmpAvgSalChart(HttpSession session) {
		
		ModelAndView mav = new ModelAndView();
		
		mav.setViewName("main.jsp");
		mav.addObject("subMenu", "viewEmpAvgSalChart");
		
		String sal_chart_data = "[";
		sal_chart_data += "['직급', '평균연봉']";
		try {
			List<SalaryDTO> avgSalInfo = this.hrservice.getAvgSalChart();
			
			for(int i=0; i<avgSalInfo.size(); i++) {
				//System.out.print(salaryList.get(i).get("jikup"));
				sal_chart_data += ", ['";
				sal_chart_data += avgSalInfo.get(i).getJikup();
				sal_chart_data += "', ";
				sal_chart_data += avgSalInfo.get(i).getAvg_salary();
				sal_chart_data += "] ";
			}
			sal_chart_data += "]";
			
			System.out.println(sal_chart_data);
			//obj.put("chartName", "직원평균연봉정보");
			
			mav.addObject("sal_chart_data", sal_chart_data);
			//mav.addObject("salaryList", salaryList);
		} catch(Exception e) {
			System.out.println("예외발생=="+e);
		}
		
		
		return mav;
	}
	
	@RequestMapping(value="/viewEmpDayOffList.do")
	public ModelAndView viewDayOffList(HttpSession session, HrListSearchDTO hrListSearchDTO) {
		
		ModelAndView mav = new ModelAndView();
		//mav.setViewName("eventScheduleForm.jsp");
		mav.setViewName("main.jsp");
		mav.addObject("subMenu", "viewDayOffList");
		mav.addObject("navigator", "[인사관리]-[직원 휴가 현황]");
		
		try {
			int getDayOffListCnt = this.hrservice.getDayOffListCnt(hrListSearchDTO);
			
			
			if(getDayOffListCnt > 0) {
				int beginRowNo = hrListSearchDTO.getSelectPageNo() * hrListSearchDTO.getRowCntPerPage() - hrListSearchDTO.getRowCntPerPage() + 1; 
				if( getDayOffListCnt < beginRowNo ){
					hrListSearchDTO.setSelectPageNo(1);
				}
			}
			
			List<Map<String, String>> getDayOffList = this.hrservice.getDayOffList(hrListSearchDTO);
			
			mav.addObject("getDayOffListCnt", getDayOffListCnt);
			mav.addObject("getDayOffList", getDayOffList);
			mav.addObject("hrListSearchDTO", hrListSearchDTO);
			
			//System.out.println(hrListSearchDTO.getSelectPageNo());
		}
		catch(Exception e) {
			System.out.println(e.getMessage());
		}
	
		return mav;
	}
	
	@RequestMapping(value="/viewEmpWorkStateList.do")
	public ModelAndView viewEmpWorkStateList(HttpSession session, HrListSearchDTO hrListSearchDTO) {
		
		//System.out.println(123456789);
		
		ModelAndView mav = new ModelAndView();
		//mav.setViewName("eventScheduleForm.jsp");
		mav.setViewName("main.jsp");
		mav.addObject("subMenu", "viewEmpWorkStateList");
		mav.addObject("navigator", "[인사관리]-[직원별 근무현황조회]");
		
		try {
			
			int getEmpInoutListCnt = this.hrservice.getEmpInoutListCnt(hrListSearchDTO);
			mav.addObject("getEmpInoutListCnt", getEmpInoutListCnt);
			
			List<Map<String, String>> getEmpInoutList = this.hrservice.getEmpInoutList(hrListSearchDTO);
			mav.addObject("getEmpInoutList", getEmpInoutList);
			
			mav.addObject("hrListSearchDTO", hrListSearchDTO);
			
			System.out.println("갯수"+getEmpInoutListCnt);
		}
		catch(Exception e) {
			System.out.println(e.getMessage());
		}
		
		return mav;
	}
	
	@RequestMapping(value="/viewEmpContentForm.do")
	public ModelAndView empViewContectProc(
			@RequestParam(value="emp_no") int emp_no
			) {
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("main.jsp");
		mav.addObject("subMenu", "viewEmpContentInfo");
		mav.addObject("navigator", "[인사관리]-[직원정보]-[상세보기]");
		
		try {
			
			EmployeeInfoUpDTO getEmpContentInfo = this.hrservice.getEmpContant(emp_no);
			
			mav.addObject("employeeInfoUpDTO", getEmpContentInfo);
			
		}catch(Exception e) {
			
		}

		return mav;
		
	}
	
	@RequestMapping(value="/viewNewEmpJoin.do")
	public ModelAndView newEmpjoinMemberForm(
			) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("main.jsp");
		mav.addObject("subMenu", "viewEmpJoinMember");
		mav.addObject("navigator", "[인사관리]-[직원정보]-[직원등록]");
		
		
		return mav;	
	}
	
	@RequestMapping(value="/newEmpInfoProc.do")
	@ResponseBody
	public int newEmpjoinMemberProc(
			EmployeeDTO employeeDTO
			) {
		int newEmpInsertCnt = 0;
		int addDayoffinfo = 0;
		try {
			
			newEmpInsertCnt = this.hrservice.getNewEmpInsertCnt(employeeDTO);
			addDayoffinfo = this.hrservice.getAddDayoffinfoCnt(employeeDTO);
		}catch(Exception e) {
			System.out.println("<사원 등록 실패>");
			System.out.println("예외 발생=>"+e);
		}
		
		return newEmpInsertCnt;
	}
	
	//================================
	//직원 상세보기 수정화면에서 수정될 값들 받는 ajax
	//================================
	@RequestMapping(value="/empInfoUpProc.do" , method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public int empInfoUpProc(EmployeeInfoUpDTO employeeInfoUpDTO) {
		int empInfoUpdate = 0;
		try {
			empInfoUpdate = this.hrservice.empInfoUpProc(employeeInfoUpDTO);
			if(empInfoUpdate != 1) {
				return 0;
			}

		}catch(Exception e) {
			System.out.println("<직원 상세보기 수정 실패>");
			System.out.println("예외 발생=>"+e);
		}
		return empInfoUpdate;
	}
	
	
	
	
	//================================
	//비동기 방식으로 휴가 신청 현황을 수정하는 메소드
	//================================
	@RequestMapping(value="/dayoffUpdateProc.do" , method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public int dayoffUpdateProc(HrDayoffDTO hrDayoffDTO) {
		int dayoffUpdateCnt = 0;
		int dayoffUpdate = 0;
		try {
			dayoffUpdate = this.hrservice.dayoffUpdateProcI(hrDayoffDTO);
			if(dayoffUpdate != 1) {
				return 0;
			}
			dayoffUpdateCnt = this.hrservice.dayoffUpdateProcII(hrDayoffDTO);
		}catch(Exception e) {
			System.out.println("<휴가 현황 수정 실패>");
			System.out.println("예외 발생=>"+e);
		}
		return dayoffUpdateCnt;
	}
}
