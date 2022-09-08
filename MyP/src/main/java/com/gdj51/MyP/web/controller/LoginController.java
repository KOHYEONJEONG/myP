package com.gdj51.MyP.web.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class LoginController {
	
	@RequestMapping(value="/header")
	public ModelAndView header(ModelAndView mav) {
		mav.setViewName("include/header");
		return mav;
	}

	@RequestMapping(value="/footer")
	public ModelAndView footer(ModelAndView mav) {
		mav.setViewName("include/footer");
		return mav;
	}
	
	@RequestMapping(value="/login")
	public ModelAndView login(ModelAndView mav) {
		mav.setViewName("login/login");
		return mav;
	}
	
	//join
	@RequestMapping(value="/join")
	public ModelAndView join(ModelAndView mav) {
		mav.setViewName("join/join");
		return mav;
	}
}
