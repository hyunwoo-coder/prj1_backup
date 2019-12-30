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
		mav.addObject("navigator", "[회계관리]-[매출정보]");
		
		return mav;
	}
	
	
	//어음정보 관련 기능 구현
	@RequestMapping(value="/viewPromiNoteList.do")
	public ModelAndView viewPromiNoteList(HttpSession session) {
		
		ModelAndView mav = new ModelAndView();
		//mav.setViewName("eventScheduleForm.jsp");
		mav.setViewName("main.jsp");
		mav.addObject("subMenu", "viewPromiNoteList");
		mav.addObject("navigator", "[회계관리]-[전자어음]");
		
		return mav;
	}
	
	@RequestMapping(value="/viewTaxInvoiceList.do")
	public ModelAndView viewTaxInvoiceList(HttpSession session) {
		
		ModelAndView mav = new ModelAndView();
		//mav.setViewName("eventScheduleForm.jsp");
		mav.setViewName("main.jsp");
		mav.addObject("subMenu", "viewTaxInvoiceList");
		mav.addObject("navigator", "[회계관리]-[세금계산서]");
		
		return mav;
	}
	
	@RequestMapping(value="/viewTaxInvoiceForm.do")
	public ModelAndView viewTaxInvoiceInfo(HttpSession session) {
		
		ModelAndView mav = new ModelAndView();
		//mav.setViewName("eventScheduleForm.jsp");
		mav.setViewName("main.jsp");
		mav.addObject("subMenu", "viewTaxInvoiceForm");
		mav.addObject("navigator", "[회계관리]-[세금계산서]-[발급하기]");
		
		return mav;
	}
	
	

}
