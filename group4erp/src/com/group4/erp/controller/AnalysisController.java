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
import com.group4.erp.OrderDTO;
import com.group4.erp.SalesInfoDTO;
import com.group4.erp.BestKwdDTO;
import com.group4.erp.service.AnalysisService;


@Controller
public class AnalysisController {
	
	@Autowired
	AnalysisService analysisService;
	
	@RequestMapping(value="/viewBestKeywdAnalysis.do")
	public ModelAndView viewBestKeywdAnalysis(HttpSession session) {
		
		ModelAndView mav = new ModelAndView();
		//mav.setViewName("eventScheduleForm.jsp");
		
		mav.setViewName("main.jsp");
		mav.addObject("subMenu", "viewkeywdAnalysis");
		mav.addObject("navigator", "[전략분석]-[인기 키워드 현황]");
		
		try {
			List<BestKwdDTO> bestKwdList = this.analysisService.getBestKwdList();
			
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
			
			mav.addObject("bestKwdList", bestKwdList);
			mav.addObject("bestKwd_chart_data", bestKwd_chart_data);
			
		} catch(Exception e) {
			System.out.println("viewBestKeywdAnalysis() 메소드에서 예외 발생 "+e);
		}
		
		

		return mav;
	}
	
	
	
	
}
