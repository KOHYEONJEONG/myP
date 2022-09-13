package com.gdj51.MyP.web.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class TestController {

	@RequestMapping(value = "/chatbot")
	public ModelAndView chatbot(ModelAndView mav) {
		mav.setViewName("chatbot/chatbotManagerment");
		return mav;
	}

	// 화면 보기 위한 테스트
	@RequestMapping(value = "/pwUpdate")
	public ModelAndView pwUpdate(ModelAndView mav) {
		mav.setViewName("member/pwUpdate");
		return mav;
	}

	// 화면 보기 위한 테스트
	@RequestMapping(value = "/mypageReviewBoard")
	public ModelAndView mypageReviewBoard(ModelAndView mav) {
		mav.setViewName("member/mypageReviewBoard");
		return mav;
	}

	// 화면 보기 위한 테스트
	@RequestMapping(value = "/pwChange")
	public ModelAndView pwChange(ModelAndView mav) {
		mav.setViewName("login/pwChange");
		return mav;
	}

	// 화면 보기 위한 테스트
	@RequestMapping(value = "/pwFind")
	public ModelAndView pwFind(ModelAndView mav) {
		mav.setViewName("login/pwFind");
		return mav;
	}

	// 화면 보기 위한 테스트
	@RequestMapping(value = "/withdraw")
	public ModelAndView withdraw(ModelAndView mav) {
		mav.setViewName("member/withdraw");
		return mav;
	}

}
