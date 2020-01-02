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
	
	
	@RequestMapping(value="/viewSalesInfoList.do")
	public ModelAndView viewSalesInfoList(HttpSession session) {
		
		ModelAndView mav = new ModelAndView();
		//mav.setViewName("eventScheduleForm.jsp");
		mav.setViewName("main.jsp");
		mav.addObject("subMenu", "viewSalesInfoList");
		mav.addObject("navigator", "[마케팅관리]-[판매현황]");
		
		try {
			int online_order_cnt = this.marketingService.getOnlineOrderCnt();
			mav.addObject("onlineOrderCnt", online_order_cnt);
			
		} catch(Exception e) {
			System.out.println("viewSalesInfoList() 메소드에서 예외 발생==="+e);
		}
		
		return mav;
	}
	
	
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
		mav.addObject("navigator", "[마케팅관리]-[이벤트행사 현황]");
			
		try {
			
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
	
	//이벤트 신청 페이지 보기
	@RequestMapping(value="/eventScheduling.do")
	public ModelAndView eventScheduling(HttpSession session) {
		
		ModelAndView mav = new ModelAndView();
		//mav.setViewName("eventScheduleForm.jsp");
		mav.setViewName("main.jsp");
		mav.addObject("subMenu", "eventReserve");
		mav.addObject("navigator", "[마케팅관리]-[이벤트행사 현황]-[이벤트신청]");
		
		try {
			int eventAllCnt = this.marketingService.getEventAllCnt();
			int eventNo = eventAllCnt+1;
			
			mav.addObject("eventNo", eventNo);
		} catch(Exception e) {
			System.out.println("eventScheduling() 메소드에서 예외 발생");
		} 
		
		return mav;
	}
	
	
	//이벤트 신청하기
	@RequestMapping( 
			value="/insertEventProc.do"
			,method=RequestMethod.POST
			,produces="application/json;charset=UTF-8"
	)
	
	@ResponseBody
	public int insertEvent(EventDTO eventDTO) {
		
		int insertEventCnt = 0;
		try {

			System.out.println("EventDTO.getAtchd_data==="+eventDTO.getAtchd_data());
			
			insertEventCnt = this.marketingService.insertEvent(eventDTO);
				
		} catch(Exception e) {
			System.out.println("insertEvent() 메소드에서 예외 발생>>> "+e);
			insertEventCnt = -1;
		} 
				
		return insertEventCnt;		
	}
	
	
	@RequestMapping(value="/deleteEvntProc.do", 
			method=RequestMethod.POST, 
			produces="application/json;charset=UTF-8")
	@ResponseBody
	public int deleteEvntProc(@RequestParam(value="evnt_no") String[] evnt_no) {
		int delCnt = 0;
		
		try {
			
			delCnt = this.marketingService.deleteEvnt(evnt_no);
			
			/*if(upDel.equals("up")) {
				upDelCnt = this.boardService.updateBoard(boardDTO);
			}
			
			//만약 삭제 모드이면 삭제 실행하고 삭제 적용행의 개수를 저장
			else {
				upDelCnt = this.boardService.deleteBoard(boardDTO);
			} */
			
		} catch(Exception e) {
			System.out.println("deleteEvntProc() 메소드에서 예외 발생 >>> "+e);
		}
				
		return delCnt;
	}
	
	
	//광고 현황 조회
	@RequestMapping(value="/viewAdApplyList.do")
	public ModelAndView viewAdApplyList(HttpSession session) {
		
		ModelAndView mav = new ModelAndView();
		//mav.setViewName("eventScheduleForm.jsp");
		mav.setViewName("main.jsp");
		mav.addObject("subMenu", "viewAdApplyList");
		mav.addObject("navigator", "[마케팅관리]-[광고신청현황]");
		
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
		mav.addObject("navigator", "[마케팅관리]-[광고신청현황]-[광고신청]");
		
		try {
			
			int ad_apply_cnt = this.marketingService.getAdApplyCnt();
			List<CorporationDTO> corpList = this.marketingService.getCorpList();
			
			int adNum = ad_apply_cnt+1;
			mav.addObject("adNum", adNum);
			mav.addObject("corpList", corpList);
			
		} catch(Exception e) {
			System.out.println("viewInsertAdApply() 메소드에서 예외 발생==="+e);
		}
		
		
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
	public int insertAdProc(AdApplyDTO adApplyDTO) {
		
		int insertAdCnt = 0;
		try {
					
			System.out.println("adApplyDTO.getEmp_no()==="+adApplyDTO.getEmp_no());
			System.out.println("adApplyDTO.getImgDoc()==="+adApplyDTO.getImg_doc());
			if(adApplyDTO.getImg_doc()==null) {
				adApplyDTO.setImg_doc("temporary");
			}
			insertAdCnt = this.marketingService.insertAd(adApplyDTO);
				
		} catch(Exception e) {
			System.out.println("insertAd() 메소드에서 예외 발생>>> "+e);
			insertAdCnt = -1;
		} 
				
		return insertAdCnt;		
	}
	
	
}
