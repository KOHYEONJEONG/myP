package com.gdj51.MyP.web.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.gdj51.MyP.web.service.IJoinService;

@Controller
public class JoinController {
	
	@Autowired
	IJoinService mailService;
	
	@RequestMapping(value="/mailCheck")
	public String mailCheck(String email) {
		System.out.println("이메일 인증 요청이 들어옴.");
		System.out.println("이메일 :"+email);
		return mailService.joinEmail(email);
	}
}
