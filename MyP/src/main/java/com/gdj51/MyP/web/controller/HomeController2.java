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

		/*
		 * List<HashMap<String, String>> popuplist = iACDao.getList("home.parkPopup",
		 * params);
		 */
		
		
		model.put("list", list);
		model.put("cnt", cnt);
		/* model.put("popuplist", popuplist); */
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
	
	@RequestMapping(value = "/gasStationAjax", method = RequestMethod.POST, produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String gasStationAjax(@RequestParam HashMap<String, String> params) throws Throwable {
		ObjectMapper mapper = new ObjectMapper();

		Map<String, Object> model = new HashMap<String, Object>();

		List<HashMap<String, String>> list = iACDao.getList("home.GasStationList", params);

		model.put("list", list);

		return mapper.writeValueAsString(model);

	}
	
	@RequestMapping(value = "/restaurantAjax", method = RequestMethod.POST, produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String restaurantAjax(@RequestParam HashMap<String, String> params) throws Throwable {
		ObjectMapper mapper = new ObjectMapper();

		Map<String, Object> model = new HashMap<String, Object>();

		List<HashMap<String, String>> list = iACDao.getList("home.RestaurantList", params);

		model.put("list", list);

		return mapper.writeValueAsString(model);

	}
	
	@RequestMapping(value = "/cinemaAjax", method = RequestMethod.POST, produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String cinemaAjax(@RequestParam HashMap<String, String> params) throws Throwable {
		ObjectMapper mapper = new ObjectMapper();

		Map<String, Object> model = new HashMap<String, Object>();

		List<HashMap<String, String>> list = iACDao.getList("home.CinemaList", params);

		model.put("list", list);

		return mapper.writeValueAsString(model);

	}
	@RequestMapping(value = "/ReviewAjax", method = RequestMethod.POST, produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String ReviewListAjax(@RequestParam HashMap<String, String> params) throws Throwable {
		
		System.out.println("ReviewAjax 실행 => "+params.toString());
		
		ObjectMapper mapper = new ObjectMapper();

		Map<String, Object> model = new HashMap<String, Object>();

		List<HashMap<String, String>> reviewlist = iACDao.getList("home.ReviewwList", params);
		
		model.put("reviewlist", reviewlist);
		
		/* model.put("popuplist", popuplist); */
		return mapper.writeValueAsString(model);

	}

	@RequestMapping(value= "/HomeAction/{gbn}",
			method = RequestMethod.POST,
			produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String HomeAction(
			@PathVariable String gbn,
			@RequestParam HashMap<String,String> params) throws Throwable{
		ObjectMapper mapper = new ObjectMapper();
		
		Map<String, Object> model = new HashMap<String,Object>();
		
		int cnt = 0;
		
		try {
			switch(gbn) {
			case "insert" : cnt = iACDao.insert("home.insert",params);
				break;
			case "insertreview" :	cnt = iACDao.insert("home.insertreview",params);
			break;
		} 
			if(cnt>0) {
				model.put("msg", "success");
			}else {
				model.put("msg", "fail");
			}
		}
			catch (Exception e) {
			e.printStackTrace();
			model.put("msg", "error");
		}
		return mapper.writeValueAsString(model);
		}
	
	@RequestMapping(value = "/ReportAjax", method = RequestMethod.POST, produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String ReportAjax(@RequestParam HashMap<String, String> params) throws Throwable {
		ObjectMapper mapper = new ObjectMapper();

		Map<String, Object> model = new HashMap<String, Object>();

		List<HashMap<String, String>> reportlist = iACDao.getList("home.CateList");
		model.put("reportlist", reportlist);
		
		/* model.put("popuplist", popuplist); */
		return mapper.writeValueAsString(model);

	}
	
	
	
}
