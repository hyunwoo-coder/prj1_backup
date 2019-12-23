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
public class LoginController {
	
	@Autowired
	//private LoginService loginService;	
	
	
	@RequestMapping(value="/loginForm.do")
	public ModelAndView loginForm() {

		ModelAndView mav = new ModelAndView();
		mav.setViewName("login.jsp");
		
		return mav;
	}
	
	@RequestMapping(value="/loginProc.do")
	public ModelAndView loginProc(HttpSession session) {
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("main.jsp");
		
		return mav;
	}
	
	@RequestMapping(value="/goMainPage.do")
	public ModelAndView goMainPage(HttpSession session) {
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("main.jsp");
		
		return mav;
	}
	
	@RequestMapping(value="/joininsert.do")
	public ModelAndView joinMembership() {
		System.out.println("사원등록 시작");
		ModelAndView mav = new ModelAndView();
		mav.setViewName("join.jsp");
		
		return mav;
	}
	@RequestMapping(value="/godelete.do")
	public ModelAndView deleteMembership() {
		System.out.println("사원삭제 시작");
		ModelAndView mav = new ModelAndView();
		mav.setViewName("delete.jsp");
		
		return mav;
	}
	
}
