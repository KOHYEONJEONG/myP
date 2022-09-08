package com.gdj51.MyP.web.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class TestController {

	@RequestMapping(value="/chatbot")
	public ModelAndView chatbot(ModelAndView mav) {
		mav.setViewName("chatbot/chatbotManagerment");
		return mav;
	}
	
	@RequestMapping(value="/join")
	public ModelAndView join(ModelAndView mav) {
		mav.setViewName("join/join");
		return mav;
	}
}
