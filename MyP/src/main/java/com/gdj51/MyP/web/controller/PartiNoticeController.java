package com.gdj51.MyP.web.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.gdj51.MyP.web.dao.IACDao;

@Controller
public class PartiNoticeController {
	@Autowired IACDao iACDao;
	
	
	@RequestMapping(value = "/notice")
	public ModelAndView notice(ModelAndView mav) {
		mav.setViewName("partiNotice/notice");
		return mav;
	}
	
	@RequestMapping(value = "/faq")
	public ModelAndView faq(ModelAndView mav) {
		mav.setViewName("partiNotice/faqList");
		return mav;
	}
	
	
}
