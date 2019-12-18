package com.group4.erp.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class HRController {
	
	@RequestMapping(value="/viewEmpList.do")
	public ModelAndView viewEmpListList(HttpSession session) {
		
		ModelAndView mav = new ModelAndView();
		//mav.setViewName("eventScheduleForm.jsp");
		mav.setViewName("main.jsp");
		mav.addObject("subMenu", "viewEmpList");
		
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

}
