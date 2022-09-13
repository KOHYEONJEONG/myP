package com.gdj51.MyP.web.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.gdj51.MyP.web.dao.IACDao;

@Controller
public class LoginController {
	
	@Autowired
	public IACDao iACDao;


	@RequestMapping(value = "/header")
	public ModelAndView header(ModelAndView mav) {
		mav.setViewName("include/header");
		return mav;
	}

	@RequestMapping(value = "/header1")
	public ModelAndView header1(ModelAndView mav) {
		mav.setViewName("include/header1");
		return mav;
	}

	@RequestMapping(value = "/footer")
	public ModelAndView footer(ModelAndView mav) {
		mav.setViewName("include/footer");
		return mav;
	}

	@RequestMapping(value = "/login")
	public ModelAndView login(ModelAndView mav) {
		mav.setViewName("login/login");
		
		return mav;
	}
	
	@RequestMapping(value= "/loginAjax",
			method = RequestMethod.POST,
			produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String testALoginAjax(
			HttpSession session,
			@RequestParam HashMap<String,String> params) throws Throwable{
		ObjectMapper mapper = new ObjectMapper();
		
		Map<String, Object> model = new HashMap<String,Object>();
		
		
		HashMap<String, String>data = iACDao.getMapData("myp.checkMem",params);
		
		if(data != null) {
			session.setAttribute("sMemNo", data.get("MEM_NUM"));
			session.setAttribute("sMemNm", data.get("NM"));
			
			model.put("msg","success");
			
		}else {
			model.put("msg","failed");
		}
		
		
		return mapper.writeValueAsString(model);
	}
	
	// join
	@RequestMapping(value = "/join")
	public ModelAndView join(ModelAndView mav) {
		mav.setViewName("join/join");
		return mav;
	}
	@RequestMapping(value= "/logout")
	public ModelAndView logout(
			HttpSession session,
			ModelAndView mav) {
		session.invalidate();
	
			
		mav.setViewName("redirect:home");
		
		
		return mav;
	}
	

}
