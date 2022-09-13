package com.gdj51.MyP.web.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class MyPageController {

	@RequestMapping(value = "/myPage")
	public ModelAndView mypage(ModelAndView mav) {
		mav.setViewName("mypage/mypage");
		return mav;
	}
}
