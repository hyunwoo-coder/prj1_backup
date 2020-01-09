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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.group4.erp.CorpSearchDTO;
import com.group4.erp.OrderDTO;
import com.group4.erp.SalesInfoDTO;
import com.group4.erp.WarehousingSearchDTO;
import com.group4.erp.BestKwdDTO;
import com.group4.erp.BestKwdSearchDTO;
import com.group4.erp.service.AnalysisService;


@Controller
public class AnalysisController {
	
	@Autowired
	AnalysisService analysisService;
	
	@RequestMapping(value="/viewBestKeywdAnalysis.do")
	public ModelAndView viewBestKeywdAnalysis(HttpSession session, BestKwdSearchDTO bestKwdSearchDTO, String rank) {
		
		ModelAndView mav = new ModelAndView();
		//mav.setViewName("eventScheduleForm.jsp");
		
		mav.setViewName("main.jsp");
		mav.addObject("subMenu", "viewkeywdAnalysis");
		mav.addObject("navigator", "[전략분석]-[인기 키워드 현황]");
		
		try {
			
			//System.out.println("bestKwdDTO.getRank==="+bestKwdDTO.getRank());
			System.out.println("rank=="+rank);
			
			bestKwdSearchDTO.setRank(rank);
			
			List<BestKwdDTO> bestKwdDTOList = this.analysisService.getBestKwdList(bestKwdSearchDTO);
			
			String bestKwd_chart_data = "[";
			bestKwd_chart_data += "['날짜', '횟수']";
				
			List<BestKwdDTO> bestKeywdInfo = this.analysisService.getKeywdSrchCntChart();
			
			for(int i=0; i<bestKeywdInfo.size(); i++) {
				bestKwd_chart_data += ", ['";
				bestKwd_chart_data += bestKeywdInfo.get(i).getDate();
				bestKwd_chart_data += "', ";
				bestKwd_chart_data += bestKeywdInfo.get(i).getKwd_cnt();
				bestKwd_chart_data += "] ";
			}
			bestKwd_chart_data += "]";
			
			//보류
			//List<BestKwdDTO> bestKeywdChart = this.analysisService.getBestKwdListChart(bestKwdSearchDTO);
			
			//String bestKwdDailyChart_data = "[";
			//bestKwdDailyChart_data += "['날짜', '검색횟수']";
			
			
			mav.addObject("bestKwdDTOList", bestKwdDTOList);
			//mav.addObject("bestKwdDTO", bestKwdDTO);
			mav.addObject("bestKwd_chart_data", bestKwd_chart_data);
			
		} catch(Exception e) {
			System.out.println("viewBestKeywdAnalysis() 메소드에서 예외 발생 "+e);
		}
		
		return mav;
	}
	
	
	@RequestMapping(value = "/searchBestKwd.do", 
				method = RequestMethod.POST, 
				produces = "application/json;charset=UTF-8")
	@ResponseBody 
	public List<BestKwdDTO> searchBestKwdProc(@RequestParam(value = "rank") String rank, BestKwdSearchDTO bestKwdSearchDTO, HttpSession session) {

		System.out.println("컨트롤러 시작"+rank);
		if(rank==null || rank.equals("")) {
			bestKwdSearchDTO.setRank(null);
		}
		
		bestKwdSearchDTO.setRank(rank);
		List<BestKwdDTO> bestKwdDTOList = null;
		
		try {
			bestKwdDTOList = this.analysisService.getBestKwdList(bestKwdSearchDTO);
			System.out.println("bestKwdDTOList.size==="+bestKwdDTOList.size());
			
		} catch (Exception e) {
			System.out.println("<입고 상세 페이지 불러오기 실패>");
			System.out.println("예외발생" + e.getMessage());
		}
		
		//System.out.println( warehContent.getBook_name() );
		return bestKwdDTOList;
	}
	
}
