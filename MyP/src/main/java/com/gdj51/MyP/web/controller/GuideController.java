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
public class GuideController {

	//chatbot(변경전) --> guide(변경)
	@Autowired
	public IACDao dao;
	
	@RequestMapping(value = "/guideManagement")
	public ModelAndView chatbotManagement(ModelAndView mav) {
		mav.setViewName("manager/guideManagerment");
		return mav;
	}
	
	@RequestMapping(value = "/guideMain")
	public ModelAndView guideMain(ModelAndView mav) {
		mav.setViewName("guide/guide");
		return mav;
	}
	
	@RequestMapping(value="/GuideListAjax",
			method = RequestMethod.POST,
			produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String GuideListAjax(@RequestParam HashMap<String, String> params) throws Throwable{
		ObjectMapper mapper = new ObjectMapper();

		Map<String, Object> model = new HashMap<String, Object>();

		System.out.println("params : "+params.toString());

		//int cnt = dao.getIntData("guide.guideCnt", params);

		List<HashMap<String, String>> list = dao.getList("guide.guideList", params);

		//model.put("cnt",cnt);//삭제 시 자식 개수가 있으면 안되게
		model.put("list", list);

		return mapper.writeValueAsString(model);
	}


}
