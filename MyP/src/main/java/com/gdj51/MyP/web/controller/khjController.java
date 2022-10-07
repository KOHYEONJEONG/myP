package com.gdj51.MyP.web.controller;

import java.util.HashMap;
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
public class khjController {

	@Autowired
	public IACDao dao;
	
	// 임의의 주소, home.jsp랑 충돌 방지 위해 따로 작성중
	@RequestMapping(value = "/home2")
	public ModelAndView header(ModelAndView mav) {
		mav.setViewName("home2");
		return mav;
	}
	
	//위치:home , 리뷰 사이드바 글쓰기 팝업
	@RequestMapping(value = "/reviewPopup2")
	public ModelAndView reviewPopup2(ModelAndView mav) {
		mav.setViewName("review/reviewPopup");
		return mav;
	}
	
	//calc_wrap
	@RequestMapping(value = "calc_wrap")
	public ModelAndView calc_wrap(ModelAndView mav) {
		mav.setViewName("side/acc");
		return mav;
	}
	
	//위치:home , 금액표 상세보기(요금비교 사이드바)
	@RequestMapping(value = "/parkFeeDetail", method = RequestMethod.POST, produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String parkFeeDetailAjax(@RequestParam HashMap<String, String> params) throws Throwable {

		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> model = new HashMap<String, Object>();
		
		HashMap<String, String> data = dao.getMapData("home.getFeelist",params);
		model.put("data",data);
		return mapper.writeValueAsString(model); // 결과값으로 발송번호 받기
	}
	

}
