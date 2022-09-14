package com.gdj51.MyP.web.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class MemberController {

	@RequestMapping(value = "/pwUpdate")
	public ModelAndView pwUpdate(ModelAndView mav) {
		mav.setViewName("member/pwUpdate");
		return mav;
	}

	@RequestMapping(value = "/mypageReviewBoard")
	public ModelAndView mypageReviewBoard(ModelAndView mav) {
		mav.setViewName("member/mypageReviewBoard");
		return mav;
	}

	@RequestMapping(value = "/withdraw")
	public ModelAndView withdraw(ModelAndView mav) {
		mav.setViewName("member/withdraw");
		return mav;
	}

}
