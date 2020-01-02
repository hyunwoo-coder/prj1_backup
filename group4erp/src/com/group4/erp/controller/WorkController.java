package com.group4.erp.controller;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.group4.erp.BusinessTripDTO;
import com.group4.erp.BusinessTripSearchDTO;
import com.group4.erp.service.WorkService;


@Controller
public class WorkController {
	

	@Autowired
	private WorkService workService;	
	
	@RequestMapping(value="/businessTripList.do")
	public ModelAndView goBusinessTripList(HttpSession session,BusinessTripSearchDTO businessTripSearchDTO) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("main.jsp");
		mav.addObject("subMenu", "businessTripList");
		mav.addObject("navigator", "[업무관리]-[출장신청&보고]");
		
		try {
			
			//리스트 종개수 구하기
			int getbusinessTripListAllCnt = this.workService.getbusinessTripListAllCnt(businessTripSearchDTO);
			
		
			
			if(getbusinessTripListAllCnt>0) {
				//선택한 페이지 번호 구하기
				int selectPageNo = businessTripSearchDTO.getSelectPageNo();
				//한 화면에 보여지는 행의 개수 구하기
				int rowCntPerPage = businessTripSearchDTO.getRowCntPerPage();
				//검색할 시작행 번호 구하기
				int beginRowNo = (selectPageNo*rowCntPerPage-rowCntPerPage+1);
				//만약 검색한 총 개수가 검색할 시작행 번호보다 작으면 선택한페이지 번호를 1로 세팅하기
				if(getbusinessTripListAllCnt<beginRowNo) businessTripSearchDTO.setSelectPageNo(1);
			}
			
		List<Map<String, String>> getbusinessTripList = this.workService.getbusinessTripList(businessTripSearchDTO);
		

		mav.addObject("businessTripList", getbusinessTripList);
		mav.addObject("businessTripListAllCnt", getbusinessTripListAllCnt);
		mav.addObject("businessTripSearchDTO", businessTripSearchDTO);
		}catch(Exception e) {
			System.out.println("<출장리스트 불러오기 실패>");
			System.out.println("예외발생"+'='+e);

		}
		return mav;
		
	}
	
	@RequestMapping(value="/businessTripForm.do")
	public ModelAndView goBusinessTripForm(HttpSession session) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("main.jsp");
		mav.addObject("subMenu", "businessTripForm");

		return mav;
		
	}
	
	/*
	 * @RequestMapping(value="/businessTripContentsForm.do") public ModelAndView
	 * goBusinessTripContentsForm(
	 * 
	 * @RequestParam(value="work_outside_seq") int work_outside_seq ,HttpSession
	 * session) { ModelAndView mav = new ModelAndView();
	 * mav.setViewName("main.jsp"); mav.addObject("subMenu",
	 * "businessTripContentsForm");
	 * 
	 * try { session.setAttribute("uri", "businessTripContentsForm.do");
	 * //[BoardServiceImpl 객체]의 getBoardDTO 메소드 호출로 1개의 게시판 글을 BoardDTO객체에 담아오기
	 * BusinessTripDTO businessTripDTO =
	 * this.workService.getbusinessTripDTO(work_outside_seq); //[ModelAndView 객체]에
	 * 1개의 게시판 글을 담고 있는 BoardDTO객체 저장하기 mav.addObject("businessTripDTO",
	 * businessTripDTO); }catch(Exception e) {
	 * System.out.println("goBusinessTripContentsForm <에러발생>"); }
	 * 
	 * return mav;
	 * 
	 * }
	 */
	
	
	
}
