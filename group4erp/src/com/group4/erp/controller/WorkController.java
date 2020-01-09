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
		
		System.out.println("insertBusinessTrip 컨트롤러");

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
	
		// /boardUpDelForm.do 접속시 호출되는 메소드 선언
		@RequestMapping( value="/businessTripUpDelForm.do" )
		public ModelAndView goBusinessTripUpDelForm(
				//b_no라는 파라미터명의 파라미터값이 저장되는 매개변수 b_no 선언
				@RequestParam(value="work_outside_seq") int work_outside_seq
				,HttpSession session
			) {
			ModelAndView mav = new ModelAndView();
			mav.setViewName("businessTripUpDelForm.jsp");
			try {
				
				session.setAttribute("uri", "businessTripUpDelForm.do");
				
				//[수정/삭제할 1개의 게시판 글 정보] 얻기
				//[BoardServiceImpl 객체]의 getBoardDTO_without_upReadcount 메소드를 호출하여 얻는다.
				//businessTripDTO businessTripDTO = this.workService.getBoardDTO_without_upReadcount(b_no);
				//mav.addObject("businessTripDTO", businessTripDTO);
				System.out.println("<접속성공> [접속URL]->/boardUpDelForm.do [호출메소드]->BoardController.goBoardUpDelForm(~) \n\n\n");
			}catch(Exception e) {
				System.out.println("<접속실패> [접속URL]->/boardUpDelForm.do [호출메소드]->BoardController.goBoardUpDelForm(~) \n\n\n");
			}
			return mav;
		}
		

		@RequestMapping(
				value="/businessTripUpDelProc.do"
				,method=RequestMethod.POST
				,produces="application/json;charset=UTF-8"
				)
		@ResponseBody
		public int goBoardUpDelProc(
					@RequestParam(value="upDel") String upDel
					,BusinessTripDTO businessTripDTO
				) {

			//수정 or 삭제 적용행의 개수가 저장되는 변수선언.
			int boardUpDelCnt = 0;
			
			try {
				
			/*
			 * //만약 수정 모드이면 수정 실행하고 수정 적용행의 개수를 저장 if(upDel.equals("up")){ boardUpDelCnt =
			 * this.boardService.updateBoard(boardDTO); } //만약 삭제 모드이면 수정 실행하고 삭제 적용행의 개수를
			 * 저장 else if(upDel.equals("del")){ boardUpDelCnt =
			 * this.boardService.deleteBoard(boardDTO); }
			 */
				
			}catch(Exception e) {
				System.out.println("오류 발생");
			}
			return boardUpDelCnt;
		}
}
