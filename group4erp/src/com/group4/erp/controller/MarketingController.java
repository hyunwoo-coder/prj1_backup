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
import com.group4.erp.EventSearchDTO;
import com.group4.erp.AdApplyDTO;
import com.group4.erp.CorporationDTO;
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
	public ModelAndView viewEventList(HttpSession session, EventSearchDTO eventSearchDTO) {
		
		ModelAndView mav = new ModelAndView();
		//mav.setViewName("eventScheduleForm.jsp");
		mav.setViewName("main.jsp");
		mav.addObject("subMenu", "viewEventList");
			
		try {
			//System.out.println("eventSearchDTO.getSearchKeyword()=="+eventSearchDTO.getSearchKeyword());
			//System.out.println("eventSearchDTO.getEvnt_category().length=="+eventSearchDTO.getEvnt_category().length);
			//System.out.println("eventSearchDTO.getEvnt_stat().length=="+eventSearchDTO.getEvnt_stat().length);
			
			/*for(int i=0; i<eventSearchDTO.getEvnt_category().length; i++) {
				System.out.println("eventSearchDTO.getEvnt_category()=="+eventSearchDTO.getEvnt_category()[i]);
			}
			
			for(int i=0; i<eventSearchDTO.getEvnt_stat().length; i++) {
				System.out.println("eventSearchDTO.getEvnt_stat()=="+eventSearchDTO.getEvnt_stat()[i]);
			}*/
			
			int eventCnt = this.marketingService.getEventCnt(eventSearchDTO);
			
			if(eventCnt >0 ) {
				int selectPageNo = eventSearchDTO.getSelectPageNo();	//선택한 페이지 번호 구하기
				int rowCntPerPage = eventSearchDTO.getRowCntPerPage();	//한 화면에 보여지는 행의 개수 구하기
				int beginRowNo = selectPageNo * rowCntPerPage - rowCntPerPage +1;	//검색할 시작행 번호 구하기
				if(eventCnt < beginRowNo) {		//만약 검색한 총 개수가 검색할 시작행 번호보다 작으면 선택한 페이지 번호를 1로 지정
					eventSearchDTO.setSelectPageNo(1);
				}
			}
			
			List<EventDTO> eventList = this.marketingService.getEventList(eventSearchDTO);
			
			mav.addObject("eventCnt", eventCnt);
			mav.addObject("eventList", eventList);
			
		} catch(Exception e) {
			System.out.println("viewEventList() 메소드에서 예외발생=="+e);
		}
		
		return mav;
	}
	
	//이벤트 신청 페이지
	@RequestMapping(value="/eventScheduling.do")
	public ModelAndView eventScheduling(HttpSession session) {
		
		ModelAndView mav = new ModelAndView();
		//mav.setViewName("eventScheduleForm.jsp");
		mav.setViewName("main.jsp");
		mav.addObject("subMenu", "eventReserve");
		
		return mav;
	}
	
	
	//광고 현황 조회
	@RequestMapping(value="/viewAdApplyList.do")
	public ModelAndView viewAdApplyList(HttpSession session) {
		
		ModelAndView mav = new ModelAndView();
		//mav.setViewName("eventScheduleForm.jsp");
		mav.setViewName("main.jsp");
		mav.addObject("subMenu", "viewAdApplyList");
		
		int ad_apply_cnt = this.marketingService.getAdApplyCnt();
		List<AdApplyDTO> ad_apply_list = this.marketingService.getAdApplyList();
		
		mav.addObject("adApplyCnt", ad_apply_cnt);
		mav.addObject("adApplyList", ad_apply_list);
		
		return mav;
	}
	
	//광고 신청 페이지
	@RequestMapping(value="/insertAdApply.do")
	public ModelAndView viewInsertAdApply(HttpSession session) {
		
		ModelAndView mav = new ModelAndView();
		//mav.setViewName("eventScheduleForm.jsp");
		mav.setViewName("main.jsp");
		mav.addObject("subMenu", "viewInsertAdApply");
		
		//int ad_apply_cnt = this.marketingService.getAdApplyCnt();
		//List<AdApplyDTO> ad_apply_list = this.marketingService.getAdApplyList();
		
		
		return mav;
	}
	
	
	
	
	@RequestMapping( 
			value="/insertAdProc.do"
			,method=RequestMethod.POST
			,produces="application/json;charset=UTF-8"
	)
	
	@ResponseBody
	public int insertCorp(CorporationDTO corporationDTO) {
		
		int insertCorpCnt = 0;
		try {
			//BoardServiceImpl 객체의 insertBoard 메소드 호출로 게시판 입력하고 게시판 입력 적용 행의 개수를 얻는다.
					
			//insertCorpCnt = this.accountService.insertCorp(corporationDTO);
				
		} catch(Exception e) {
			System.out.println("insertCorp() 메소드에서 예외 발생>>> "+e);
			insertCorpCnt = -1;
		} 
				
		return insertCorpCnt;		
	}
	
	
}
