package com.gdj51.MyP.web.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class SidebarController {

	@RequestMapping(value = "/managerSidebar")
	public ModelAndView sidebar(ModelAndView mav) {
		mav.setViewName("include/manager_sidebar");
		return mav;
	}

	@RequestMapping(value = "/mypageSidebar")
	public ModelAndView mypageSidebar(ModelAndView mav) {
		mav.setViewName("include/mypage_sidebar");
		return mav;
	}

	@RequestMapping(value = "/partiNoticeSidebar")
	public ModelAndView partiNoticeSidebar(ModelAndView mav) {
		mav.setViewName("include/partiNotice_sidebar");
		return mav;
	}

	@RequestMapping(value = "/rankingSidebar")
	public ModelAndView rankingSidebar(ModelAndView mav) {
		mav.setViewName("include/ranking_sidebar");
		return mav;
	}

}
