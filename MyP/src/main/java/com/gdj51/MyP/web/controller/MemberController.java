package com.gdj51.MyP.web.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.gdj51.MyP.common.service.IPagingService;
import com.gdj51.MyP.web.dao.IACDao;

@Controller
public class MemberController {

	@Autowired
	public IACDao dao;

	@Autowired
	public IPagingService ips;
	
	
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
