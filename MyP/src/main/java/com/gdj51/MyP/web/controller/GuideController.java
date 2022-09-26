package com.gdj51.MyP.web.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class GuideController {

	//chatbot(변경전) --> guide(변경)
	
	@RequestMapping(value = "/guideManagement")
	public ModelAndView chatbotManagement(ModelAndView mav) {
		mav.setViewName("manager/guideManagerment");
		return mav;
	}
	
	@RequestMapping(value = "/guideMain")
	public ModelAndView guideMain(ModelAndView mav) {
		mav.setViewName("guide/guide");
		return mav;
	}

}
