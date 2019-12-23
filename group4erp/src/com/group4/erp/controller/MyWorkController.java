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
			,MyCareBookListDTO myCareBookListDTO
			) {
		
		ModelAndView mav = new ModelAndView();
		//mav.setViewName("eventScheduleForm.jsp");
		
		mav.setViewName("main.jsp");
		mav.addObject("subMenu", "viewMyCareBookList");
		try {
			List<Map<String, String>> MyCareBookList = this.myWorkService.getMyCareBookList(myCareBookListDTO);

			mav.addObject("MyCareBookList", MyCareBookList);
		}catch(Exception e) {
			System.out.println("<게시글 불러오기 실패>");
			System.out.println("예외발생"+e);
		}
		return mav;
	}
}
