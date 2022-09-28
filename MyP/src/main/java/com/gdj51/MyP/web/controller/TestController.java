package com.gdj51.MyP.web.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class TestController {

	@RequestMapping(value="/sidebar") 
		public ModelAndView sidebar(ModelAndView mav) {
			mav.setViewName("include/sidebar");
			return mav;
		
	}
}
