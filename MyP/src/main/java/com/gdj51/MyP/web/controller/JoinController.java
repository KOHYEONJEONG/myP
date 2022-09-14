package com.gdj51.MyP.web.controller;

import java.util.HashMap;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.bind.annotation.RequestParam;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.gdj51.MyP.web.dao.IACDao;
import com.gdj51.MyP.web.service.IJoinService;
import com.gdj51.MyP.util.Utils;

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
		
		//아이디 중복체크
		int result = dao.memberCheck("join.idCheck",params);
		
		logger.info("결과값 : " + result);
		
		if(result != 0 ) {
			return "fail";//중복 아이디가 존재
		}else {
			return "success";
		}
		
	}
	
	@RequestMapping(value="/join")
	public ModelAndView jInsert(
			ModelAndView mav) {//회원가입
		mav.setViewName("/join/join");
	
		return mav;
	}
	
	@RequestMapping(value="/JAction/{gbn}",
			method = RequestMethod.GET,
			produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String JAction(
			@PathVariable String gbn,
			@RequestParam HashMap<String, String> params) throws Throwable {
		ObjectMapper mapper = new ObjectMapper();
		
		Map<String, Object> model = new HashMap<String, Object>();
		int cnt = 0;
		try {
			switch (gbn) {
			case "insert":
				//암호화
	            params.put("pwd",Utils.encryptAES128(params.get("pwd")));
	            System.out.println("회원가입 param : "+params.toString());
	            
	            String email = params.get("email1")+'@'+params.get("email2");
	            
	            params.put("email",email);
	            
	            cnt = dao.insert("join.autInsert", params);
				cnt = dao.insert("join.joinInsert", params);
				break;

			}
			if(cnt > 0) {
				model.put("msg", "success");
			} else {
				model.put("msg", "fail");
			}
		}
		catch (Exception e) {
			e.printStackTrace();
			model.put("msg", "error");
		}
		return mapper.writeValueAsString(model);
	}

}
