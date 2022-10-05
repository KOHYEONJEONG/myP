package com.gdj51.MyP.web.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class khjController {

	// 임의의 주소, home.jsp랑 충돌 방지 위해 따로 작성중
	// 카카오맵 카테고리별 기능 추가 예정
	@RequestMapping(value = "/home2")
	public ModelAndView header(ModelAndView mav) {
		mav.setViewName("home2");
		return mav;
	}
	
	//reviewPopup2
	@RequestMapping(value = "/reviewPopup2")
	public ModelAndView reviewPopup2(ModelAndView mav) {
		mav.setViewName("review/reviewPopup");
		return mav;
	}

}
