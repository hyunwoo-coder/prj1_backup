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
@ControllerAdvice	//클래스 내부에서 발생하는 모든 예외를 처리해준다. 예외 발생시 ExceptionHandler 어노테이션이 붙은 메소드가 실행된다.
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
	
	@RequestMapping(value="/joininsert.do")
	public ModelAndView joinMembership() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("join.jsp");
		
		return mav;
	}
	
}
