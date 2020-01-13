package com.group4.erp.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.group4.erp.ApprovalDTO;
import com.group4.erp.ApprovalSearchDTO;
import com.group4.erp.CorpSearchDTO;
import com.group4.erp.CorporationDTO;
import com.group4.erp.DayOffApplyDTO;
import com.group4.erp.EventDTO;
import com.group4.erp.EventSearchDTO;
import com.group4.erp.service.ApprovalService;
import com.group4.erp.service.MarketingService;
import com.group4.erp.service.MyWorkService;

@Controller
public class ApprovalController {
	
	@Autowired
	ApprovalService approvalService;
	
	@Autowired
	MarketingService marketingService;
	
	@Autowired
	MyWorkService myWorkService;
	
	@RequestMapping(value="/viewApprovalList.do")
	public ModelAndView viewApprovalList(HttpSession session, ApprovalSearchDTO approvalSearchDTO) {
		
		ModelAndView mav = new ModelAndView();
		//mav.setViewName("eventScheduleForm.jsp");
		
		String emp_no = (String)session.getAttribute("emp_id");
		
		mav.setViewName("main.jsp");
		mav.addObject("subMenu", "viewApprovalList");
		mav.addObject("navigator", "[업무관리]-[문서 결재]");
		
		approvalSearchDTO.setEmp_no(emp_no);
		
		int approvalCnt = this.approvalService.getApprovalReqCnt(approvalSearchDTO);
		int approvalResCnt = this.approvalService.getApprovalResCnt(approvalSearchDTO);
		
		List<ApprovalDTO> approvalReqList = this.approvalService.getApprovalReqList(approvalSearchDTO);
		List<ApprovalDTO> approvalResList = this.approvalService.getApprovalResList(approvalSearchDTO);
		
		mav.addObject("approvalCnt", approvalCnt);
		mav.addObject("approvalReqList", approvalReqList);
		mav.addObject("approvalResCnt", approvalResCnt);
		mav.addObject("approvalResList", approvalResList);
		

		return mav;
	}
	
	@RequestMapping(value="/viewApprovalDoc.do")
	public ModelAndView viewApprovalDoc(HttpSession session, 
			ApprovalDTO approvalDTO, 
			EventSearchDTO eventSearchDTO, 
			DayOffApplyDTO dayOffApplyDTO, 
			String document_no) {
		
		ModelAndView mav = new ModelAndView();
		
		mav.setViewName("main.jsp");
		mav.addObject("subMenu", "viewApprovalDoc");
		mav.addObject("navigator", "[업무관리]-[문서 결재]-[결재할 문서 검토]");
		
		//String approvalType = approvalDTO.getDocument_no();
		String approvalDoc = "";
		String tableName = "";
		
		if(document_no.indexOf("EV") >=0 ) {
			approvalDoc="EV";
			tableName = "event_info";
			eventSearchDTO.setSearchKeyword(document_no);
			eventSearchDTO.setTableName(tableName);
			
			int approvalState = this.approvalService.updateApprovalState(document_no);
			
			int event_state = this.approvalService.updateEventState(document_no);
			
			EventDTO myEventInfo = this.marketingService.getMyEventInfoApproval(document_no);
			mav.addObject("approvalInfoList", myEventInfo);
			
			
		} else if(document_no.indexOf("DO") >=0) {
			System.out.println("휴가 신청 결재화면 보기");
			
			String doc_num = document_no.substring(3);
			
			int my_dayoff_approval_no = Integer.parseInt(doc_num);
			
			System.out.println("my_dayoff_approval_no==="+my_dayoff_approval_no);
		
			approvalDoc = "DO";
			tableName = "emp_day_off_apply";
			
			DayOffApplyDTO myDayOffApplyInfo = this.myWorkService.getMyDayOffApproval(my_dayoff_approval_no);
			
			//System.out.println("myDayOffApplyInfo.getEmp_no==="+myDayOffApplyInfo.getDayoff_category());
			
			mav.addObject("myDayOffApplyInfo", myDayOffApplyInfo);
			mav.addObject("approvalCategory", "휴가 신청 결재 바랍니다.");
		}
			
		mav.addObject("approvalDoc", approvalDoc);
		
		
		return mav;
		
	}
	
	@RequestMapping(value="/updateEventApproavalProc.do", 
			method=RequestMethod.POST, 
			produces="application/json;charset=UTF-8")
	@ResponseBody
	public int updateEvntApprovalProc(ApprovalDTO approvalDTO, EventDTO eventDTO, String approvalYn, String document_no) {
	
		int approvalUpCnt = 0;
		int evntUpCnt = 0;
		
		try {
			
			System.out.println("approvalYn==="+approvalYn);
			System.out.println("document_no==="+document_no);
			
			approvalDTO.setE_works_state_cd(approvalYn);
			approvalDTO.setDocument_no(document_no);
			eventDTO.setEvnt_state_cd(approvalYn);
			eventDTO.setEvnt_no(document_no);

			//System.out.println("approvalDTO.getApprovalYn=="+approvalDTO.);
			approvalUpCnt = this.approvalService.updateApprovalProc(approvalDTO);
			evntUpCnt = this.marketingService.updateEvntApprovalState(eventDTO);
			
			/*if(upDel.equals("up")) {
				upDelCnt = this.boardService.updateBoard(boardDTO);
			}
			
			//만약 삭제 모드이면 삭제 실행하고 삭제 적용행의 개수를 저장
			else {
				upDelCnt = this.boardService.deleteBoard(boardDTO);
			} */
			
		} catch(Exception e) {
			System.out.println("deleteCorpProc() 메소드에서 예외 발생 >>> "+e);
		}
				
		return approvalUpCnt;
	}

}
