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

import com.fasterxml.jackson.databind.ObjectMapper;
import com.gdj51.MyP.web.dao.IACDao;

@Controller
public class HomeController2 {

	@Autowired
	public IACDao iACDao;

	@RequestMapping(value = "/HomeAjax", method = RequestMethod.POST, produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String HomeListAjax(@RequestParam HashMap<String, String> params) throws Throwable {
		ObjectMapper mapper = new ObjectMapper();

		Map<String, Object> model = new HashMap<String, Object>();

		List<HashMap<String, String>> list = iACDao.getList("home.List", params);

		int cnt = iACDao.getIntData("home.SearchCnt", params);

		model.put("list", list);
		model.put("cnt", cnt);

		return mapper.writeValueAsString(model);

	}

	@RequestMapping(value = "/cultureAjax", method = RequestMethod.POST, produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String cultureAjax(@RequestParam HashMap<String, String> params) throws Throwable {
		ObjectMapper mapper = new ObjectMapper();

		Map<String, Object> model = new HashMap<String, Object>();

		List<HashMap<String, String>> list = iACDao.getList("home.CultureList", params);

		model.put("list", list);

		return mapper.writeValueAsString(model);

	}
}
