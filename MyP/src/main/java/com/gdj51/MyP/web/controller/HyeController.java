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

@Controller
public class HyeController {

	@Autowired 
	public IACDao dao;
	
	@RequestMapping(value = "/home3")
	public ModelAndView home3(ModelAndView mav) {
		mav.setViewName("home3");
		return mav;
	}
	
	/*현재위치에 최단거리 주차장 5개*/
	@RequestMapping(value = "/shortDistanceAjax", method = RequestMethod.POST, produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String shortDistanceAjax(@RequestParam HashMap<String, String> params) throws Throwable {
		ObjectMapper mapper = new ObjectMapper();

		Map<String, Object> model = new HashMap<String, Object>();

		List<HashMap<String, String>> list = dao.getList("home.getShortDistance", params);

		model.put("list", list);

		return mapper.writeValueAsString(model);

	}
	
	//위치:home , 금액표 상세보기(요금비교 사이드바)
			@RequestMapping(value = "/parkDetail", method = RequestMethod.POST, produces = "text/json;charset=UTF-8")
			@ResponseBody
			public String parkDetailAjax(@RequestParam HashMap<String, String> params) throws Throwable {

				ObjectMapper mapper = new ObjectMapper();
				Map<String, Object> model = new HashMap<String, Object>();
				
				HashMap<String, String> data = dao.getMapData("home.getFeelist",params);
				model.put("data",data);
				return mapper.writeValueAsString(model); // 결과값으로 발송번호 받기
			}
	
}
