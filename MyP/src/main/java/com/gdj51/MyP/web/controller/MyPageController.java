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

	@RequestMapping(value = "/dataManagement")
	public ModelAndView dataManagement(ModelAndView mav) {
		mav.setViewName("manager/dataManagement");
		return mav;
	}

	@RequestMapping(value = "/memManagement")
	public ModelAndView memManagement(ModelAndView mav) {
		mav.setViewName("manager/memManagement");
		return mav;
	}

	@RequestMapping(value = "/reportReviewManagement")
	public ModelAndView reportReviewManagement(ModelAndView mav) {
		mav.setViewName("manager/reportReviewManagement");
		return mav;
	}

	@RequestMapping(value = "/chatbot")
	public ModelAndView chatbot(ModelAndView mav) {
		mav.setViewName("chatbot/chatbot");
		return mav;
	}

	@RequestMapping(value = "/chatbotDetail")
	public ModelAndView chatbotDetail(ModelAndView mav) {
		mav.setViewName("chatbot/chatbotDetail");
		return mav;
	}

	@RequestMapping(value = "/chatbotRegister")
	public ModelAndView chatbotRegister(ModelAndView mav) {
		mav.setViewName("chatbot/chatbotRegister");
		return mav;
	}

	@RequestMapping(value = "/chatbotUpdate")
	public ModelAndView chatbotUpdate(ModelAndView mav) {
		mav.setViewName("chatbot/chatbotUpdate");
		return mav;
	}

}
