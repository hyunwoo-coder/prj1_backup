package com.group4.erp.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import com.group4.erp.service.HRService;

import java.util.*;

import com.group4.erp.*;
import com.group4.erp.service.HRService;
import com.group4.erp.service.InvenService;
import com.group4.erp.service.MyWorkService;

@Controller
public class MyWorkController {
	
	@Autowired
	MyWorkService myWorkService;
	
	@RequestMapping(value="/goMyCareBookList.do")
	public ModelAndView viewEmpListList(
			HttpSession session
			,MyWorkSearchDTO myWorkSearchDTO
			) {
		
		ModelAndView mav = new ModelAndView();
		//mav.setViewName("eventScheduleForm.jsp");
		
		//화면에 나의 상품 관리 페이지 띄우는 코드
		mav.setViewName("main.jsp");
		mav.addObject("subMenu", "viewMyCareBookList");
		try {

			//===================================================================================================
			//검색된 관리 상품 목록 불러오는 코드
			List<Map<String, String>> MyCareBookList = this.myWorkService.getMyCareBookList(myWorkSearchDTO);
			mav.addObject("MyCareBookList", MyCareBookList);

			//===================================================================================================
			//검색 항목 불러오는 코드
			List<Map<String, String>> categoryList = this.myWorkService.getCategoryList(myWorkSearchDTO);
			mav.addObject("categoryList", categoryList);
			
			List<Map<String, String>> bookSize = this.myWorkService.getBookSizeList(myWorkSearchDTO);
			mav.addObject("bookSize", bookSize);
			
			List<Map<String, String>> branchList = this.myWorkService.getBranchList(myWorkSearchDTO);
			mav.addObject("branchList", branchList);
			
			List<Map<String, String>> publisherList = this.myWorkService.getPublisherList(myWorkSearchDTO);
			mav.addObject("publisherList", publisherList);
			
			//===================================================================================================
			//페이징 처리를 위한 총 검색 개수 불러오는 코드
			int myWorkListAllCnt = this.myWorkService.getMyWorkListAllCnt(myWorkSearchDTO);
			mav.addObject("myWorkListAllCnt", myWorkListAllCnt);
			
			if(myWorkListAllCnt>0) {
				//선택한 페이지 번호 구하기
				int selectPageNo = myWorkSearchDTO.getSelectPageNo();
				// 한 화면에 보여지는 행의 개수 구하기
				int rowCntPerPage = myWorkSearchDTO.getRowCntPerPage();
				// 검색할 시작행 번호 구하기
				int beginRowNo = (selectPageNo*rowCntPerPage-rowCntPerPage+1);
				// 만약 검색 한 총 개수가 검색할 시작행 번호 보다 작으면
				// 선택한 페이지 번호를 1로 세팅하기
				if(myWorkListAllCnt<beginRowNo) {
					myWorkSearchDTO.setSelectPageNo(1);
				}
			}
		}catch(Exception e) {
			System.out.println("<게시글 불러오기 실패>");
			System.out.println("예외발생"+e);
		}
		return mav;
	}
}
