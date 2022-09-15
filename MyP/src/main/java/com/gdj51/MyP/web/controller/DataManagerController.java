package com.gdj51.MyP.web.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
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
public class DataManagerController {

	private static final Logger logger = LoggerFactory.getLogger(DataManagerController.class);
	
	@Autowired
	public IACDao dao;

	@Autowired
	public IPagingService ips;
	// 관리자 페이지 데이터관리 목록화면
		@RequestMapping(value = "/dataManagement")
		public ModelAndView dataManagement(ModelAndView mav) {
			mav.setViewName("manager/dataManagement");
			return mav;
		}
		
	
	//관리자 페이지 데이터관리 리스트화면
		@RequestMapping(value="/dataManagementList")
		public ModelAndView dataManagement(
				@RequestParam HashMap<String, String> params,
				ModelAndView mav) {
			int page = 1;
			
			if(params.get("page") != null && params.get("page") != "")
			{
				page = Integer.parseInt(params.get("page"));
			}
				
			mav.addObject("page", page);
			mav.setViewName("manager/dataManagement");
			
			return mav;
		}
		
		//관리자 페이지 데이터관리 주차장 ajax
		@RequestMapping(value="/dataManagementAjax",
				method = RequestMethod.POST,
				produces = "text/json;charset=UTF-8")
		@ResponseBody
		public String dataManagementAjax(@RequestParam HashMap<String, String> params) throws Throwable{
			ObjectMapper mapper = new ObjectMapper();
			
			Map<String, Object> model = new HashMap<String, Object>();
			
			System.out.println("params : "+params.toString());
			
			int cnt = dao.getIntData("manager.cardatacnt", params);
			
			HashMap<String, Integer> pd
			= ips.getPagingData(Integer.parseInt(params.get("page")), cnt, 10, 5);
			
			
			params.put("start", Integer.toString(pd.get("start")));
			params.put("end", Integer.toString(pd.get("end")));
			
			List<HashMap<String, String>> list = dao.getList("manager.cardataList", params);

			model.put("list", list);
			model.put("pd", pd);
			
			return mapper.writeValueAsString(model);
		}
		
}
