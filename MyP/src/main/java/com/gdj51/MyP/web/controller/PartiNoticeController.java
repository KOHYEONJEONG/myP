package com.gdj51.MyP.web.controller;

import java.util.HashMap;
import java.util.List;
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
public class PartiNoticeController {
	@Autowired 
	public IACDao iACDao;
	
	@Autowired
	public IPagingService ips;
	
	
	@RequestMapping(value = "/notice")
	public ModelAndView notice(ModelAndView mav) {
		mav.setViewName("partiNotice/notice");
		return mav;
	}

	@RequestMapping(value= "/faq")
	public ModelAndView faq(
			@RequestParam HashMap<String,String> params,
			ModelAndView mav) {
		int page = 1;
		
		if(params.get("page")!=null && params.get("page")!="") {
		page = Integer.parseInt(params.get("page"));
		}
		mav.addObject("page",page);
		
		mav.setViewName("partiNotice/faqList");
				
		return mav;
	}
	
	
}
