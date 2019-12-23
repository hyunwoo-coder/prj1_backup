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
public class AccountController {
	
	//AccountService accountService;
	@Autowired
	AccountService accountService;
	
	@RequestMapping(value="/viewCorpList.do")
	public ModelAndView viewCorpList(HttpSession session, CorpSearchDTO corpSearchDTO) {
		
		ModelAndView mav = new ModelAndView();
		//mav.setViewName("eventScheduleForm.jsp");
		
		mav.setViewName("main.jsp");
		mav.addObject("subMenu", "viewCorpList");
		
		try {
			
			int corpListCnt = this.accountService.getCorpListCnt();
			List<CorporationDTO> corpList = this.accountService.getCorpList(corpSearchDTO);
			
			System.out.println("corpListCnt=="+corpListCnt);
			
			mav.addObject("corpListCnt", corpListCnt);
			mav.addObject("corpList", corpList);
						
		} catch(Exception e) {
			System.out.println("예외발생=="+e);
		}
		
		return mav;
	}
	
	
	
	@RequestMapping(value="/goInsertCorpPage.do")
	public ModelAndView goInsertCorpPage(HttpSession session) {
		
		ModelAndView mav = new ModelAndView();
		//mav.setViewName("eventScheduleForm.jsp");
		
		mav.setViewName("main.jsp");
		mav.addObject("subMenu", "goInsertCorpPage");
		
		
		
		return mav;
	}
	
	
	@RequestMapping( 
			value="/insertCorpProc.do"
			,method=RequestMethod.POST
			,produces="application/json;charset=UTF-8"
	)
	
	@ResponseBody
	public int insertCorp(CorporationDTO corporationDTO) {
		
		int insertCorpCnt = 0;
		try {
			//BoardServiceImpl 객체의 insertBoard 메소드 호출로 게시판 입력하고 게시판 입력 적용 행의 개수를 얻는다.
					
			insertCorpCnt = this.accountService.insertCorp(corporationDTO);
				
		} catch(Exception e) {
			System.out.println("insertCorp() 메소드에서 예외 발생>>> "+e);
			insertCorpCnt = -1;
		} 
				
		return insertCorpCnt;		
	}

}
