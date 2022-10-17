package com.gdj51.MyP.web.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class TestController {

	// 임의의 주소, home.jsp랑 충돌 방지 위해 따로 작성중
	// 카카오맵 카테고리별 기능 추가 예정
	@RequestMapping(value = "/home1")
	public ModelAndView header(ModelAndView mav) {
		mav.setViewName("home1");
		return mav;
	}
	
	@RequestMapping(value = "/home2")
	public ModelAndView home2(ModelAndView mav) {
		mav.setViewName("home2");
		return mav;
	}

	@RequestMapping(value = "/home3")
	public ModelAndView home3(ModelAndView mav) {
		mav.setViewName("home3");
		return mav;
	}
	
	// 장원석 공유하기 하는 page
	@RequestMapping(value = "/home4")
	public ModelAndView home4(ModelAndView mav) {
		mav.setViewName("home4");
		return mav;
	}

}
