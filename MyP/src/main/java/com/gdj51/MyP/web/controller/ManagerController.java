package com.gdj51.MyP.web.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
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
public class ManagerController {

	private static final Logger logger = LoggerFactory.getLogger(ManagerController.class);

	@Autowired
	public IACDao dao;

	@Autowired
	public IPagingService ips;

	// 관리자 페이지 카테고리 목록화면
	@RequestMapping(value = "/categoryManagement")
	public ModelAndView categoryManagement(ModelAndView mav) {
		mav.setViewName("manager/categoryManagement");
		return mav;
	}

	@RequestMapping(value = "/categoryManagementAction/{gbn}", method = RequestMethod.POST, produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String categoryManagementActionAjax(@PathVariable String gbn, @RequestParam HashMap<String, String> params)
			throws Throwable {
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> model = new HashMap<String, Object>();

		int cnt = 0;

		try {
			switch (gbn) {
			case "insert":
				cnt = dao.insert("cate.insertCate", params);
				break;
			case "update":
				cnt = dao.update("cate.updateCate", params);
				break;
			case "delete":
				cnt = dao.update("cate.deleteCate", params);
				break;
			}

			if (cnt > 0) {
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

	@RequestMapping(value = "/categoryManagementList", method = RequestMethod.POST, produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String categoryManagementListAjax(@RequestParam HashMap<String, String> params) throws Throwable {
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> model = new HashMap<String, Object>();

		// 페이지 받아오게 되어있음
		int cnt = dao.getIntData("cate.getCateCnt", params);

		HashMap<String, Integer> pd = ips.getPagingData(Integer.parseInt(params.get("page")), cnt, 5, 5);

		params.put("start", Integer.toString(pd.get("start")));
		params.put("end", Integer.toString(pd.get("end")));

		List<HashMap<String, String>> list = dao.getList("cate.getCateList", params);

		model.put("list", list);
		model.put("pd", pd);

		return mapper.writeValueAsString(model);
	}

	// 관리자 페이지 카테고리 등록화면
	@RequestMapping(value = "/categoryManagementRegister")
	public ModelAndView categoryManagementRegister(ModelAndView mav) {
		mav.setViewName("manager/categoryManagementRegister");
		return mav;
	}

	// 관리자 페이지 카테고리 수정화면
	@RequestMapping(value = "/categoryManagementUpdate")
	public ModelAndView categoryManagementUpdate(ModelAndView mav) {
		mav.setViewName("manager/categoryManagementUpdate");
		return mav;
	}

	// 관리자 페이지 데이터관리 목록화면
	@RequestMapping(value = "/dataManagement")
	public ModelAndView dataManagement(ModelAndView mav) {
		mav.setViewName("manager/dataManagement");
		return mav;
	}
	
	//관리자 페이지 데이터관리 리스트화면
	@RequestMapping(value="/DataMList")
	public ModelAndView DataMList(
			@RequestParam HashMap<String, String> params,
			ModelAndView mav) {
		
		
		mav.setViewName("manager/dataManagement");
		
		return mav;
	}
	
	//관리자 페이지 데이터관리 주차장 ajax
	@RequestMapping(value="/DataMListAjax",
			method = RequestMethod.POST,
			produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String DataMListAjax(@RequestParam HashMap<String, String> params) throws Throwable{
		ObjectMapper mapper = new ObjectMapper();
		
		Map<String, Object> model = new HashMap<String, Object>();
		
		List<HashMap<String, String>> list = dao.getList("manager.cardataList", params);
		
		model.put("list", list);
		
		return mapper.writeValueAsString(model);
	}

	// 관리자 페이지 회원관리 목록화면
	@RequestMapping(value = "/memManagement")
	public ModelAndView memManagement(@RequestParam HashMap<String, String> params,ModelAndView mav) {
		
		int page = 1;//첫페이지로 나타내려고
		
		if(params.get("page")!= null && params.get("page") != "") {
			page = Integer.parseInt(params.get("page"));
		}
		//페이지 번호
		mav.addObject("page", page);
		
		mav.setViewName("manager/memManagement");
		return mav;
	}
	
	//Ajax를 붙여야지 AOP에서 관리 안함.
	@RequestMapping(value = "/memManagementListAjax", method = RequestMethod.POST, produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String memManagementListAjax(@RequestParam HashMap<String,String> params) throws Throwable{
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> model = new HashMap<String, Object>();
		
		System.out.println("params : "+params.toString());
		
		// 페이지 받아오게 되어있음
		int cnt = dao.getIntData("member.getMemberCnt", params);
		
		HashMap<String, Integer> pd = ips.getPagingData(Integer.parseInt(params.get("page")), cnt, 5, 5);

		params.put("start", Integer.toString(pd.get("start")));
		params.put("end", Integer.toString(pd.get("end")));

		List<HashMap<String, String>> list = dao.getList("member.getMemberList", params);

		model.put("list", list);
		model.put("pd", pd);
		
		return mapper.writeValueAsString(model);
	}
	
	@RequestMapping(value="/autorityPopup")
	public ModelAndView autorityPopup(@RequestParam HashMap<String,String> params,ModelAndView mav) throws Throwable{
		mav.setViewName("manager/autorityPopup");
		return mav;
	}

	// 관리자 페이지 신고관리 목록화면
	@RequestMapping(value = "/reportReviewManagement")
	public ModelAndView reportReviewManagement(ModelAndView mav) {
		mav.setViewName("manager/reportReviewManagement");
		return mav;
	}
}
