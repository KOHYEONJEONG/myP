package com.gdj51.MyP.web.controller;

import java.util.HashMap;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import org.springframework.web.bind.annotation.RequestParam;

import com.gdj51.MyP.web.dao.IACDao;
import com.gdj51.MyP.web.service.IJoinService;

@Controller
public class JoinController {
	
	@Autowired
	public IJoinService mailService;
	
	@Autowired
	public IACDao dao;
	
	private static final Logger logger = LoggerFactory.getLogger(JoinController.class);
	
	@RequestMapping(value="/mailCheck",
    method=RequestMethod.GET)
	@ResponseBody
	public String mailCheck(@RequestParam HashMap<String, String> params) {
		System.out.println("이메일 인증 요청이 들어옴.");
		System.out.println("이메일 :"+params);
		return mailService.joinEmail(params.get("email"));
	}
	
	@RequestMapping(value="/checkIdAjax", method=RequestMethod.POST)
	@ResponseBody
	public String checkIdAjax(@RequestParam HashMap<String, String> params)throws Throwable{
		
		logger.info("checkIdAjax() 진입");
		
		int result = dao.memberCheck("join.idCheck",params);
		
		logger.info("결과값 : " + result);
		
		if(result != 0 ) {
			return "fail";//중복 아이디가 존재
		}else {
			return "success";
		}
		
	}

}
