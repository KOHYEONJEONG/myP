package com.gdj51.MyP.web.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.gdj51.MyP.common.service.IPagingService;
import com.gdj51.MyP.web.dao.IACDao;

@Controller
public class ParkInfoController {
	
	@Autowired
	public IACDao dao;

	@Autowired
	public IPagingService ips;

	@RequestMapping(value = "/parkinfo")
	public ModelAndView parkinfo(@RequestParam HashMap<String, String> params, 
			ModelAndView mav) {
		
		int page = 1;

		if(params.get("page") != null && params.get("page") != "")
		{
			page = Integer.parseInt(params.get("page"));
		}

		
		mav.addObject("page", page);
	

		mav.setViewName("parkInfo/pubserviceParkingList");
		
		return mav;
	}
	
	@RequestMapping(value = "/parkinfodetail")
	public ModelAndView parkinfodetail(@RequestParam HashMap<String, String> params,
			ModelAndView mav) throws Throwable{
		if(params.get("no") != null && params.get("no") != "") {
			
			HashMap<String, String> data
			= dao.getMapData("info.getinfo", params);
			
			mav.addObject("data", data);
			
			mav.setViewName("parkInfo/pubserviceParkingListDetail");
			
			mav.setViewName("parkInfo/pubserviceParkingListDetail");
		} else {
			mav.setViewName("redirect:parkinfo");
		}
		
		return mav;
		
	}
	
	//관리자 페이지 데이터관리 리스트화면
		@RequestMapping(value="/parkinfoList", 
				method = RequestMethod.POST, 
				produces = "text/json;charset=UTF-8")
		@ResponseBody
		public String parkinfoAjax(
				@RequestParam HashMap<String, String> params,
				ModelAndView mav) throws Throwable {
			ObjectMapper mapper = new ObjectMapper();
			Map<String, Object> model = new HashMap<String, Object>();
			
			System.out.println("params : "+params.toString());
			
			int cnt = dao.getIntData("info.carinfocnt", params);
			
			HashMap<String, Integer> pd = ips.getPagingData(Integer.parseInt(params.get("page")), cnt, 10, 5);
			
			params.put("start", Integer.toString(pd.get("start")));
			params.put("end", Integer.toString(pd.get("end")));
			
			List<HashMap<String, String>> list = dao.getList("info.carinfoList", params);
			
			model.put("list", list);
			model.put("pd", pd);

			return mapper.writeValueAsString(model);
		}
		
		@RequestMapping(value="/INFOAction/{gbn}",
				method = RequestMethod.POST,
				produces = "text/json;charset=UTF-8")
		@ResponseBody
		public String INFOAction(@PathVariable String gbn,
				@RequestParam HashMap<String, String> params) throws Throwable {
			
			ObjectMapper mapper = new ObjectMapper();
			
			Map<String, Object> model = new HashMap<String, Object>();
			
			int cnt = 0;
			
			try {
				switch (gbn) {
				case "update":
					cnt = dao.update("info.updateInfo", params);
				break;
				case "delete":
					cnt = dao.update("info.deleteInfo", params);
				break;
				}
				
				if(cnt > 0) {
					model.put("msg", "success");
				} else {
					model.put("msg", "fail");
				}
			
			} catch (Exception e) {
				e.printStackTrace();
				model.put("msg", "error");
			}
			return mapper.writeValueAsString(model);
		}
		

}
