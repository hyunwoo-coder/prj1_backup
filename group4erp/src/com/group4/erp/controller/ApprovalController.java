package com.group4.erp.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.group4.erp.ApprovalDTO;
import com.group4.erp.ApprovalSearchDTO;
import com.group4.erp.CorpSearchDTO;
import com.group4.erp.CorporationDTO;
import com.group4.erp.service.ApprovalService;

@Controller
public class ApprovalController {
	
	@Autowired
	ApprovalService approvalService;
	
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

}
