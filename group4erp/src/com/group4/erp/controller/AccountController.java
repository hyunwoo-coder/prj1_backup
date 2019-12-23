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
import org.springframework.web.servlet.ModelAndView;

import com.group4.erp.CorporationDTO;
import com.group4.erp.service.AccountService;


@Controller
public class AccountController {
	
	//AccountService accountService;
	@Autowired
	AccountService accountService;
	
	@RequestMapping(value="/viewCorpList.do")
	public ModelAndView viewCorpList(HttpSession session) {
		
		ModelAndView mav = new ModelAndView();
		//mav.setViewName("eventScheduleForm.jsp");
		
		mav.setViewName("main.jsp");
		mav.addObject("subMenu", "viewCorpList");
		
		try {
			
			int corpListCnt = this.accountService.getCorpListCnt();
			List<CorporationDTO> corpList = this.accountService.getCorpList();
			
			System.out.println("corpListCnt=="+corpListCnt);
			
			mav.addObject("corpListCnt", corpListCnt);
			mav.addObject("corpList", corpList);
						
		} catch(Exception e) {
			System.out.println("예외발생=="+e);
		}
		
		return mav;
	}

}
