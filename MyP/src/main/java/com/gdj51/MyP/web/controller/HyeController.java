package com.gdj51.MyP.web.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class HyeController {

	@RequestMapping(value = "/home3")
	public ModelAndView home3(ModelAndView mav) {
		mav.setViewName("home3");
		return mav;
	}
	
}
