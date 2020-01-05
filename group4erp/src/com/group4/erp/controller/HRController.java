package com.group4.erp.controller;

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

import com.group4.erp.service.AccountService;
import com.group4.erp.service.HRService;

import com.group4.erp.*;
import com.group4.erp.service.InvenService;

@Controller
public class HRController {
	
	@Autowired
	HRService hrservice;
	AccountService accountService;
	
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

		ModelAndView mav = new ModelAndView();

		try {

			int emp_tot_cnt = this.hrservice.getEmpListAllCnt(salListSearchDTO);
			
			System.out.println("emp_tot_cnt=="+emp_tot_cnt);
			
			List<SalaryDTO> empSalList = this.hrservice.getEmpSalList(salListSearchDTO);
			TimeDTO timeDTO = this.hrservice.getTime();
			
			if(emp_tot_cnt >0 ) {
				int selectPageNo = salListSearchDTO.getSelectPageNo();	//선택한 페이지 번호 구하기
				int rowCntPerPage = salListSearchDTO.getRowCntPerPage();	//한 화면에 보여지는 행의 개수 구하기
				int beginRowNo = selectPageNo * rowCntPerPage - rowCntPerPage +1;	//검색할 시작행 번호 구하기
				if(emp_tot_cnt < beginRowNo) {		//만약 검색한 총 개수가 검색할 시작행 번호보다 작으면 선택한 페이지 번호를 1로 지정
					salListSearchDTO.setSelectPageNo(1);
				}
			}
			
			
			mav.setViewName("main.jsp");
			mav.addObject("salListSearchDTO", salListSearchDTO);
			mav.addObject("empSalList", empSalList);
			mav.addObject("timeDTO", timeDTO);

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
	public ModelAndView viewEmpSalInfo(HttpSession session, SalListSearchDTO salListSearchDTO) {
		
		ModelAndView mav = new ModelAndView();
		
		System.out.println("salListSearchDTO.getEmp_no()==="+salListSearchDTO.getEmp_no());
		
		int emp_no = Integer.parseInt(salListSearchDTO.getEmp_no());
		
		TimeDTO timeDTO = this.hrservice.getTime();
		int emp_tot_cnt = this.hrservice.getEmpListAllCnt(salListSearchDTO);
		
		System.out.println("emp_tot_cnt=="+emp_tot_cnt);
		
		//List<SalaryDTO> empSalInfo = this.hrservice.getEmpSalList(salListSearchDTO);
	
		System.out.println("급여 컨트롤러 시작");
		SalaryDTO salaryDTO = this.hrservice.getSalaryInfo(emp_no);
		System.out.println("컨트롤러 급여명세서 조회 성공");
		
		mav.setViewName("main.jsp");
		mav.addObject("salaryInfo", salaryDTO);
		mav.addObject("subMenu", "viewEmpSalInfo");
		mav.addObject("timeDTO", timeDTO);
		
		return mav;
	}
	
	
	@RequestMapping( 
			value="/goPayCheckProc.do"
			,method=RequestMethod.POST
			,produces="application/json;charset=UTF-8"
	)
	
	@ResponseBody
	public int payCheckProc(List<SalaryDTO> salDTOList) {
		
		int payCheckCnt = 0;
		System.out.println("payCheckProc() 메소드 시작");
		
		try {
			//BoardServiceImpl 객체의 insertBoard 메소드 호출로 게시판 입력하고 게시판 입력 적용 행의 개수를 얻는다.
					
			payCheckCnt = this.accountService.payCheckProc(salDTOList);
				
		} catch(Exception e) {
			System.out.println("payCheckProc() 메소드에서 예외 발생>>> "+e);
			payCheckCnt = -1;
		} 
				
		return payCheckCnt;		
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
			mav.addObject("getDayOffListCnt", getDayOffListCnt);
			
			List<Map<String, String>> getDayOffList = this.hrservice.getDayOffList(hrListSearchDTO);
			mav.addObject("getDayOffList", getDayOffList);
			
			mav.addObject("hrListSearchDTO", hrListSearchDTO);
			
			System.out.println(hrListSearchDTO.getSelectPageNo());
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
			
			EmployeeInfoDTO getEmpContentInfo = this.hrservice.getEmpContant(emp_no);
			
			mav.addObject("employeeInfoDTO", getEmpContentInfo);
			
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
		String mgrEmpName = null;
		try {
			
			//mgrEmpName = this.hrservice.getMgrEmpName(employeeDTO);
			
			newEmpInsertCnt = this.hrservice.getNewEmpInsertCnt(employeeDTO);
			
		}catch(Exception e) {
			System.out.println("<사원 등록 실패>");
			System.out.println("예외 발생=>"+e);
		}
		
		return newEmpInsertCnt;
	}
	
	
	
	@RequestMapping(value="/dayoffUpdateProc.do" , method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public int dayoffUpdateProc(HrDayoffDTO hrDayoffDTO) {
		int dayoffUpdateCnt = 0;
		try {
			dayoffUpdateCnt = this.hrservice.dayoffUpdateProc(hrDayoffDTO);
		}catch(Exception e) {
			System.out.println("<휴가 현황 수정 실패>");
			System.out.println("예외 발생=>"+e);
		}
		return dayoffUpdateCnt;
	}
}
