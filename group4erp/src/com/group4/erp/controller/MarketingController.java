package com.group4.erp.controller;

import java.util.*;
import javax.servlet.http.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.group4.erp.EventDTO;
import com.group4.erp.service.MarketingService;



@Controller
public class MarketingController {
	
	@Autowired
	//private LoginService loginService;	
	MarketingService marketingService;
	
	@RequestMapping(value="/viewNewBooksList.do")
	public ModelAndView viewNewBookList(HttpSession session) {
		
		ModelAndView mav = new ModelAndView();
		//mav.setViewName("eventScheduleForm.jsp");
		mav.setViewName("main.jsp");
		mav.addObject("subMenu", "newBooksList");
		
		return mav;
	}
	
	//이벤트 현황 조회
	@RequestMapping(value="/viewEventList.do")
	public ModelAndView viewEvnetList(HttpSession session) {
		
		ModelAndView mav = new ModelAndView();
		//mav.setViewName("eventScheduleForm.jsp");
		mav.setViewName("main.jsp");
		mav.addObject("subMenu", "viewEventList");
		
		int eventCnt = this.marketingService.getEventCnt();
		
		List<EventDTO> eventList = this.marketingService.getEventList();
		
		mav.addObject("eventCnt", eventCnt);
		mav.addObject("eventList", eventList);
		
		return mav;
	}
	
	
	@RequestMapping(value="/eventScheduling.do")
	public ModelAndView eventScheduling(HttpSession session) {
		
		ModelAndView mav = new ModelAndView();
		//mav.setViewName("eventScheduleForm.jsp");
		mav.setViewName("main.jsp");
		mav.addObject("subMenu", "eventReserve");
		
		return mav;
	}
	
	
}
