package com.group4.erp.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import com.group4.erp.service.HRService;
import com.group4.erp.EmployeeDTO;
import com.group4.erp.SalaryDTO;
import java.util.*;

import com.group4.erp.*;
import com.group4.erp.service.HRService;
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
		
		try {
			
			int getEmpBoardListCnt = this.hrservice.getEmpListAllCnt(hrListSearchDTO);
			mav.addObject("getEmpBoardListCnt", getEmpBoardListCnt);

			List<Map<String, String>> getEmpBoardList = this.hrservice.getEmpList(hrListSearchDTO);
			mav.addObject("getEmpBoardList", getEmpBoardList);
			mav.addObject("hrListSearchDTO", hrListSearchDTO);
		}catch(Exception e) {
			System.out.println("예외발생=="+e);

		}
		
		return mav;
	}
	
	
	@RequestMapping(value="/viewSalList.do")
	public ModelAndView viewSalList(HttpSession session) {
		
		int sikdae = 10;
		int car_care = 10;

		float health_care = (float) 0.0323;
		double emp_insurance = 0.08d;
		double annuity = 0.045d;
		double residence = 0.1d;
		double income = 0.027d;
		
		ModelAndView mav = new ModelAndView();
		//mav.setViewName("eventScheduleForm.jsp");
		
		TimeDTO timeDTO = this.hrservice.getTime();
		
		List<SalaryDTO> empSalList = this.hrservice.getEmpSalList();
		
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
		mav.addObject("empSalList", empSalList);
		mav.addObject("timeDTO", timeDTO);
		mav.addObject("sikdae", sikdae);
		mav.addObject("car_care", car_care);
		mav.addObject("subMenu", "viewSalList");
		
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
	
	@RequestMapping(value="/viewEmpDayOffList.do")
	public ModelAndView viewDayOffList(HttpSession session, HrListSearchDTO hrListSearchDTO) {
		
		ModelAndView mav = new ModelAndView();
		//mav.setViewName("eventScheduleForm.jsp");
		mav.setViewName("main.jsp");
		mav.addObject("subMenu", "viewDayOffList");
		
		try {
			
			int getDayOffListCnt = this.hrservice.getDayOffListCnt(hrListSearchDTO);
			mav.addObject("getDayOffListCnt", getDayOffListCnt);
			
			List<Map<String, String>> getDayOffList = this.hrservice.getDayOffList(hrListSearchDTO);
			mav.addObject("getDayOffList", getDayOffList);
		}
		catch(Exception e) {
			System.out.println(e.getMessage());
		}

		
		return mav;
	}
	
	@RequestMapping(value="/viewEmpWorkStateList.do")
	public ModelAndView viewEmpWorkStateList(HttpSession session, HrListSearchDTO hrListSearchDTO) {
		
		ModelAndView mav = new ModelAndView();
		//mav.setViewName("eventScheduleForm.jsp");
		mav.setViewName("main.jsp");
		mav.addObject("subMenu", "viewEmpWorkStateList");
		
		try {
			int getEmpInoutListCnt = this.hrservice.getEmpInoutListCnt(hrListSearchDTO);
			mav.addObject("getEmpInoutListCnt", getEmpInoutListCnt);
			
			List<Map<String, String>> getEmpInoutList = this.hrservice.getEmpInoutList(hrListSearchDTO);
			mav.addObject("getEmpInoutList", getEmpInoutList);
		}
		catch(Exception e) {
			System.out.println(e.getMessage());
		}
		
		return mav;
	}

}
