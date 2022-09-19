package com.gdj51.MyP.web.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class TestController {

	@RequestMapping(value = "/parkinfo")
	public ModelAndView parkinfo(ModelAndView mav) {
		mav.setViewName("parkInfo/pubserviceParkingList");
		return mav;
	}
}
