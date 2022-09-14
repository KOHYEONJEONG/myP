package com.gdj51.MyP.web.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.gdj51.MyP.common.service.IPagingService;
import com.gdj51.MyP.web.dao.IACDao;

@Controller
public class ManagerController {

	private static final Logger logger = LoggerFactory.getLogger(ManagerController.class);
	

	@Autowired
	public IACDao dao;

	@Autowired
	public IPagingService ips;

	// 관리자 페이지 카테고리 목록화면
	@RequestMapping(value = "/categoryManagement")
	public ModelAndView categoryManagement(ModelAndView mav) {
		mav.setViewName("manager/categoryManagement");
		return mav;
	}

	// 관리자 페이지 카테고리 등록화면
	@RequestMapping(value = "/categoryManagementRegister")
	public ModelAndView categoryManagementRegister(ModelAndView mav) {
		mav.setViewName("manager/categoryManagementRegister");
		return mav;
	}

	// 관리자 페이지 카테고리 수정화면
	@RequestMapping(value = "/categoryManagementUpdate")
	public ModelAndView categoryManagementUpdate(ModelAndView mav) {
		mav.setViewName("manager/categoryManagementUpdate");
		return mav;
	}

	// 관리자 페이지 데이터관리 목록화면
	@RequestMapping(value = "/dataManagement")
	public ModelAndView dataManagement(ModelAndView mav) {
		mav.setViewName("manager/dataManagement");
		return mav;
	}

	// 관리자 페이지 회원관리 목록화면
	@RequestMapping(value = "/memManagement")
	public ModelAndView memManagement(ModelAndView mav) {
		mav.setViewName("manager/memManagement");
		return mav;
	}

	// 관리자 페이지 신고관리 목록화면
	@RequestMapping(value = "/reportReviewManagement")
	public ModelAndView reportReviewManagement(ModelAndView mav) {
		mav.setViewName("manager/reportReviewManagement");
		return mav;
	}
}
