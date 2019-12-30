/*
 * 회계업무 관련 기능들을 처리
 * 
 */

package com.group4.erp.controller;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.group4.erp.CorpSearchDTO;
import com.group4.erp.CorporationDTO;
import com.group4.erp.service.AccountService;


@Controller
public class AnalysisController {
	
	//AccountService accountService;
	@Autowired
	AccountService accountService;
	
	@RequestMapping(value="/viewBestKeywdAnalysis.do")
	public ModelAndView viewBestKeywdAnalysis(HttpSession session) {
		
		ModelAndView mav = new ModelAndView();
		//mav.setViewName("eventScheduleForm.jsp");
		
		mav.setViewName("main.jsp");
		mav.addObject("subMenu", "viewkeywdAnalysis");
		mav.addObject("navigator", "[전략분석]-[인기 키워드 현황]");

		return mav;
	}
	
}
