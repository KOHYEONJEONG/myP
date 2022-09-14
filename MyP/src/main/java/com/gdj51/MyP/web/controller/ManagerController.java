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
	public String categoryManagementAction(@PathVariable String gbn, @RequestParam HashMap<String, String> params)
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
	public String categoryManagementList(@RequestParam HashMap<String, String> params) throws Throwable {
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> model = new HashMap<String, Object>();

		// 페이지 받아오게 되어있음
		int cnt = dao.getIntData("cate.getCateCnt", params);

		HashMap<String, Integer> pd = ips.getPagingData(Integer.parseInt(params.get("page")), cnt, 10, 5);

		params.put("start", Integer.toString(pd.get("start")));
		params.put("end", Integer.toString(pd.get("end")));

		List<HashMap<String, String>> list = dao.getList("cob.getCateList", params);

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

	// 관리자 페이지 회원관리 목록화면
	@RequestMapping(value = "/memManagement")
	public ModelAndView memManagement(ModelAndView mav) {
		mav.setViewName("manager/memManagement");
		return mav;
	}

	// 관리자 페이지 신고관리 목록화면
	@RequestMapping(value = "/reportReviewManagement")
	public ModelAndView reportReviewManagement(ModelAndView mav) {
		mav.setViewName("manager/reportReviewManagement");
		return mav;
	}
}
