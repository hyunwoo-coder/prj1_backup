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



@Controller
public class InvenController {
	
	@Autowired
	//private LoginService loginService;	
	

	
	@RequestMapping(value="/goBookInvenList.do")
	public ModelAndView goBookInvenList(HttpSession session) {
		
		ModelAndView mav = new ModelAndView();
		//mav.setViewName("eventScheduleForm.jsp");
		mav.setViewName("main.jsp");
		mav.addObject("subMenu", "viewInventoryList");	//viewInventoryList 아무 이름이나 설정 가능. 메인 페이지에서 해당 메뉴 뜰 때 해당 페이지를 임포트하기 위해서 붙이는 플래그명
		
		return mav;
	}
	
	
}
