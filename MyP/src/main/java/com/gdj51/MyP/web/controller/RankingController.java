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
import com.gdj51.MyP.common.service.IPagingService;

@Controller
public class RankingController {
	
	@Autowired
	public IACDao dao;
	
	@Autowired
	public IPagingService ips;
	
	@RequestMapping(value = "/rankingSystemGoodParking")
	public ModelAndView rankingSystemGoodParking(ModelAndView mav) {
		mav.setViewName("ranking/rankingSystemGoodParking");
		return mav;
	}

	@RequestMapping(value = "/rankingFeeReasonableBoard")
	public ModelAndView rankingFeeReasonableBoard(ModelAndView mav) {
		mav.setViewName("ranking/rankingFeeReasonableBoard");
		return mav;
	}

	@RequestMapping(value = "/rankingSystemGoodParkingList",
			method = RequestMethod.POST, 
			produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String rankingSystemGoodParkingList(
			@RequestParam HashMap<String, String> params) throws Throwable {
		
		ObjectMapper mapper = new ObjectMapper();
		
		Map<String, Object> model = new HashMap<String, Object>();
		
		int cnt = dao.getIntData("rank.getRankCnt", params);
		
		HashMap<String, Integer> pd = ips.getPagingData(Integer.parseInt(params.get("page")),
				cnt, 10, 5);

		params.put("start", Integer.toString(pd.get("start")));
		params.put("end", Integer.toString(pd.get("end")));
		
		List<HashMap<String, String>> list = dao.getList("rank.getSysRankList", params);
		
		model.put("list", list);
		model.put("pd", pd);
		
		return mapper.writeValueAsString(model);
	}
	
	@RequestMapping(value = "/rankingFeeReasonableBoardList",
			method = RequestMethod.POST, 
			produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String rankingFeeReasonableBoardList(
			@RequestParam HashMap<String, String> params) throws Throwable {
		
		ObjectMapper mapper = new ObjectMapper();
		
		Map<String, Object> model = new HashMap<String, Object>();
		
		int cnt = dao.getIntData("rank.getRankCnt", params);
		
		HashMap<String, Integer> pd = ips.getPagingData(Integer.parseInt(params.get("page")),
				cnt, 10, 5);

		params.put("start", Integer.toString(pd.get("start")));
		params.put("end", Integer.toString(pd.get("end")));
		
		List<HashMap<String, String>> list = dao.getList("rank.getFeeRankList", params);
		
		model.put("list", list);
		model.put("pd", pd);
		
		return mapper.writeValueAsString(model);
	}
	
	
}
