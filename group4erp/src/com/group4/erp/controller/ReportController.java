package com.group4.erp.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class ReportController {
	
	//매출정보 기능 구현
	@RequestMapping(value="/viewSalesReport.do")
	public ModelAndView viewSalesReport(HttpSession session) {
		
		ModelAndView mav = new ModelAndView();
		//mav.setViewName("eventScheduleForm.jsp");
		mav.setViewName("main.jsp");
		mav.addObject("subMenu", "viewSalesReport");
		
		return mav;
	}
	
	
	//어음정보 관련 기능 구현
	@RequestMapping(value="/viewPromiNoteList.do")
	public ModelAndView viewPromiNoteList(HttpSession session) {
		
		ModelAndView mav = new ModelAndView();
		//mav.setViewName("eventScheduleForm.jsp");
		mav.setViewName("main.jsp");
		mav.addObject("subMenu", "viewPromiNoteList");
		
		return mav;
	}
	

}
