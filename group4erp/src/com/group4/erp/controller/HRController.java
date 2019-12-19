package com.group4.erp.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import java.util.*;

import com.group4.erp.*;
import com.group4.erp.service.HRService;
import com.group4.erp.service.InvenService;

@Controller
public class HRController {
	
	@Autowired
	private HRService hrservice;	
	
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

		}catch(Exception e) {
			System.out.println("<직원 리스트 호출 실패>");
		}
		
		return mav;
	}
	
	
	@RequestMapping(value="/viewSalList.do")
	public ModelAndView viewSalList(HttpSession session) {
		
		ModelAndView mav = new ModelAndView();
		//mav.setViewName("eventScheduleForm.jsp");
		mav.setViewName("main.jsp");
		mav.addObject("subMenu", "viewSalList");
		
		return mav;
	}
	
	@RequestMapping(value="/viewEmpSalInfo.do")
	public ModelAndView viewEmpSalInfo(HttpSession session) {
		
		ModelAndView mav = new ModelAndView();
		//mav.setViewName("eventScheduleForm.jsp");
		mav.setViewName("main.jsp");
		mav.addObject("subMenu", "viewEmpSalInfo");
		
		return mav;
	}
	
	@RequestMapping(value="/viewEmpDayOffList.do")
	public ModelAndView viewDayOffList(HttpSession session) {
		
		ModelAndView mav = new ModelAndView();
		//mav.setViewName("eventScheduleForm.jsp");
		mav.setViewName("main.jsp");
		mav.addObject("subMenu", "viewDayOffList");
		
		return mav;
	}
	
	@RequestMapping(value="/viewEmpWorkStateList.do")
	public ModelAndView viewEmpWorkStateList(HttpSession session) {
		
		ModelAndView mav = new ModelAndView();
		//mav.setViewName("eventScheduleForm.jsp");
		mav.setViewName("main.jsp");
		mav.addObject("subMenu", "viewEmpWorkStateList");
		
		return mav;
	}

}
