package com.group4.erp.controller;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;


@Controller
public class WorkController {
	

	@Autowired
	//private LoginService loginService;	
	
	@RequestMapping(value="/businessTripForm.do")
	public ModelAndView goBusinessTripForm(HttpSession session) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("main.jsp");
		mav.addObject("subMenu", "businessTripForm");

		return mav;
		
	}
	
}
