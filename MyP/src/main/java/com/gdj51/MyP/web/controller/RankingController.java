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
import com.gdj51.MyP.web.dao.IACDao;
import com.gdj51.MyP.web.service.IJoinService;

@Controller
public class RankingController {
	
	@Autowired
	public IJoinService mailService;
	
	@Autowired
	public IACDao dao;

	@RequestMapping(value = "/rankingFeeReasonableBoard")
	public ModelAndView rankingFeeReasonableBoard(ModelAndView mav) {
		mav.setViewName("ranking/rankingFeeReasonableBoard");
		return mav;
	}

	@RequestMapping(value = "/rankingSystemGoodParking",
			method = RequestMethod.POST, 
			produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String rankingFeeReasonableBoard(
			@RequestParam HashMap<String, String> params) throws Throwable {
		ObjectMapper mapper = new ObjectMapper();
		
		Map<String, Object> model = new HashMap<String, Object>();
		
		List<HashMap<String, String>> list = dao.getList("rank.getCaList", params);
		
		model.put("list", list);
		
		return mapper.writeValueAsString(model);
	}
	
	
}
