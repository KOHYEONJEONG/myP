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
			ModelAndView mav) throws Throwable {
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
	@RequestMapping(value="/datacarAjax",
			method = RequestMethod.POST,
			produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String datacarAjax(@RequestParam HashMap<String, String> params) throws Throwable{
		ObjectMapper mapper = new ObjectMapper();

		Map<String, Object> model = new HashMap<String, Object>();

		System.out.println("params : "+params.toString());

		int cnt = dao.getIntData("datamanager.cardatacnt", params);

		HashMap<String, Integer> pd
		= ips.getPagingData(Integer.parseInt(params.get("page")), cnt, 10, 5);


		params.put("start", Integer.toString(pd.get("start")));
		params.put("end", Integer.toString(pd.get("end")));

		List<HashMap<String, String>> list1 = dao.getList("datamanager.cardataList", params);

		model.put("list1", list1);
		model.put("pd", pd);

		return mapper.writeValueAsString(model);
	}

	
	//관리자 페이지 데이터관리 음식점 ajax
	@RequestMapping(value="/datafoodAjax",
			method = RequestMethod.POST,
			produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String datafoodAjax(@RequestParam HashMap<String, String> params) throws Throwable{
		ObjectMapper mapper = new ObjectMapper();

		Map<String, Object> model = new HashMap<String, Object>();

		System.out.println("params : "+params.toString());

		int cnt = dao.getIntData("datamanager.fooddatacnt", params);

		HashMap<String, Integer> pd
		= ips.getPagingData(Integer.parseInt(params.get("page")), cnt, 10, 5);


		params.put("start", Integer.toString(pd.get("start")));
		params.put("end", Integer.toString(pd.get("end")));

		List<HashMap<String, String>> list2 = dao.getList("datamanager.fooddataList", params);


		model.put("list2", list2);
		model.put("pd", pd);

		return mapper.writeValueAsString(model);
	}

	//관리자 페이지 데이터관리 문화생활 ajax
			@RequestMapping(value="/datacultureAjax",
					method = RequestMethod.POST,
					produces = "text/json;charset=UTF-8")
			@ResponseBody
			public String datacultureAjax(@RequestParam HashMap<String, String> params) throws Throwable{
				ObjectMapper mapper = new ObjectMapper();

				Map<String, Object> model = new HashMap<String, Object>();

				System.out.println("params : "+params.toString());

				int cnt = dao.getIntData("datamanager.culturedatacnt", params);

				HashMap<String, Integer> pd
				= ips.getPagingData(Integer.parseInt(params.get("page")), cnt, 10, 5);


				params.put("start", Integer.toString(pd.get("start")));
				params.put("end", Integer.toString(pd.get("end")));

				List<HashMap<String, String>> list3 = dao.getList("datamanager.culturedataList", params);


				model.put("list3", list3);
				model.put("pd", pd);

				return mapper.writeValueAsString(model);
			}
			
	//관리자 페이지 데이터관리 주유소 ajax
		@RequestMapping(value="/datagasAjax",
				method = RequestMethod.POST,
				produces = "text/json;charset=UTF-8")
		@ResponseBody
		public String datagasAjax(@RequestParam HashMap<String, String> params) throws Throwable{
			ObjectMapper mapper = new ObjectMapper();

			Map<String, Object> model = new HashMap<String, Object>();

			System.out.println("params : "+params.toString());

			int cnt = dao.getIntData("datamanager.gasdatacnt", params);

			HashMap<String, Integer> pd
			= ips.getPagingData(Integer.parseInt(params.get("page")), cnt, 10, 5);


			params.put("start", Integer.toString(pd.get("start")));
			params.put("end", Integer.toString(pd.get("end")));

			List<HashMap<String, String>> list4 = dao.getList("datamanager.gasdataList", params);


			model.put("list4", list4);
			model.put("pd", pd);

			return mapper.writeValueAsString(model);
		}

}
