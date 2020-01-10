package com.group4.erp.controller;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.group4.erp.BusinessTripDTO;
import com.group4.erp.BusinessTripSearchDTO;
import com.group4.erp.service.WorkService;


@Controller
public class WorkController {
	

	@Autowired
	private WorkService workService;	
	
	@RequestMapping(value="/businessTripList.do")
	public ModelAndView goBusinessTripList(HttpSession session
				,BusinessTripSearchDTO businessTripSearchDTO
				,BusinessTripDTO businessTripDTO
				) {
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
				

				if(businessTripDTO.getEmp_id()== null){
					businessTripDTO.setEmp_id((String)session.getAttribute("emp_id"));
				}
				
			}
			
		List<Map<String, String>> getbusinessTripList = this.workService.getbusinessTripList(businessTripSearchDTO);
		
		System.out.println("insertBusinessTrip 컨트롤러");
		System.out.println(businessTripDTO.getEmp_id());

		mav.addObject("businessTripList", getbusinessTripList);
		mav.addObject("businessTripListAllCnt", getbusinessTripListAllCnt);
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
	
	
	//출장 상세 보기
	@RequestMapping(value="/businessTripContentsForm.do")
	public ModelAndView goBusinessTripContentsForm(
			@RequestParam(value="work_outside_seq") int work_outside_seq
			) {
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("main.jsp");
		mav.addObject("subMenu", "businessTripContentsForm"); 
		mav.addObject("navigator", "[업무관리]-[출장신청&보고]-[상세보기]");
		
		try {
			
			BusinessTripDTO businessTripDTO = this.workService.getBusinessTripDTO(work_outside_seq);
			
			mav.addObject("businessTripDTO", businessTripDTO);
			
		}catch(Exception e) {
			System.out.println("goBusinessTripContentsForm <에러발생>"+"="+e); 
		}

		return mav;
		
	}
	
	
		@RequestMapping(
				value="/businessTripRegProc.do"
				,method=RequestMethod.POST
				,produces="application/json;charset=UTF-8"
			)
		@ResponseBody
		public int insertBusinessTrip(
				BusinessTripDTO businessTripDTO
		){
			System.out.println("insertBusinessTrip 컨트롤러");
			System.out.println(businessTripDTO.getDestination());
			System.out.println(businessTripDTO.getEmp_no());
			System.out.println(businessTripDTO.getOutside_start_time());
			System.out.println(businessTripDTO.getOutside_end_time());
			System.out.println(businessTripDTO.getWork_outside_reason());
			int businessTripRegCnt = 0;
			try {
				//[BoardServiceImpl 객체]의 insertBoard 메소드 호출로 게시판 입력하고 [게시판 입력 적용행의 개수] 얻기
				businessTripRegCnt = this.workService.insertBusinessTrip(businessTripDTO);
			}catch(Exception e) {
				System.out.println("<에러발생>="+e);
				businessTripRegCnt= -1;
			}
			return businessTripRegCnt;
			
		}
	
		//businessTripUpDelForm.do 접속시 호출되는 메소드 선언
		@RequestMapping( value="/businessTripUpDelForm.do" )
		public ModelAndView goBusinessTripUpDelForm(
				@RequestParam(value="work_outside_seq") int work_outside_seq
				,HttpSession session
			) {
			ModelAndView mav = new ModelAndView();
			mav.setViewName("main.jsp");
			mav.addObject("subMenu", "businessTripUpDelForm"); 
			mav.addObject("navigator", "[업무관리]-[출장신청&보고]-[수정/삭제]");

			BusinessTripDTO businessTripDTO = this.workService.getBusinessTripDTO(work_outside_seq);
			mav.addObject("businessTripDTO", businessTripDTO);
			System.out.println("businessTripDTO");
			try {
				System.out.println("<접속성공> [접속URL]->/businessTripUpDelForm.do UpDelForm(~) \n\n\n");
			}catch(Exception e) {
				System.out.println("<접속실패> [접속URL]->/businessTripUpDelForm.do UpDelForm(~) \n\n\n");
			}
			return mav;
		}
		@RequestMapping(
				value="/businessTripUpDelAppProc.do"
				,method=RequestMethod.POST
				,produces="application/json;charset=UTF-8"
				)
		@ResponseBody
		public int goBusinessTripUpDelProc(
					@RequestParam(value="upDelApp") String upDelApp
					,BusinessTripDTO businessTripDTO
				) {
			//수정 or 삭제 적용행의 개수가 저장되는 변수선언.
			int businessTripUpDelAppCnt = 0;
			try {
			  //만약 수정 모드이면 수정 실행하고 수정 적용행의 개수를 저장 
			if(upDelApp.equals("up")){ businessTripUpDelAppCnt = this.workService.updateBusinessTrip(businessTripDTO); }
			//만약 삭제 모드이면 수정 실행하고 삭제 적용행의 개수를 저장 
			else if(upDelApp.equals("del")){ businessTripUpDelAppCnt = this.workService.deleteBusinessTrip(businessTripDTO); }
			//만약 승인 이면 수정 실행하고 승인 적용행의 개수를 저장 
			else if(upDelApp.equals("approved")){ businessTripUpDelAppCnt = this.workService.approvedBusinessTrip(businessTripDTO); }
					
			}catch(Exception e) {
				System.out.println("오류 발생");
			}
			return businessTripUpDelAppCnt;
		}
}
