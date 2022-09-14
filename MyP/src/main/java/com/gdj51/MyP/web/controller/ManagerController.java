package com.gdj51.MyP.web.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class ManagerController {

	private static final Logger logger = LoggerFactory.getLogger(ManagerController.class);

	// 관리자 페이지 카테고리 목록화면
	@RequestMapping(value = "/category")
	public ModelAndView category(ModelAndView mav) {
		mav.setViewName("manager/category");
		return mav;
	}

	// 관리자 페이지 카테고리 등록화면
	@RequestMapping(value = "/categoryRegister")
	public ModelAndView categoryRegister(ModelAndView mav) {
		mav.setViewName("manager/categoryRegister");
		return mav;
	}

	// 관리자 페이지 카테고리 수정화면
	@RequestMapping(value = "/categoryUpdate")
	public ModelAndView categoryUpdate(ModelAndView mav) {
		mav.setViewName("manager/categoryUpdate");
		return mav;
	}

	// 관리자 페이지 데이터관리 목록화면
	@RequestMapping(value = "/data")
	public ModelAndView data(ModelAndView mav) {
		mav.setViewName("manager/data");
		return mav;
	}

	// 관리자 페이지 회원관리 목록화면
	@RequestMapping(value = "/mem")
	public ModelAndView mem(ModelAndView mav) {
		mav.setViewName("manager/mem");
		return mav;
	}

	// 관리자 페이지 신고관리 목록화면
	@RequestMapping(value = "/reportReview")
	public ModelAndView reportReview(ModelAndView mav) {
		mav.setViewName("manager/reportReview");
		return mav;
	}
}
