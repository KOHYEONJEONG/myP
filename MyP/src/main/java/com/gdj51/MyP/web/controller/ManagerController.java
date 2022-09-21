package com.gdj51.MyP.web.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

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
	
	// 관리자 페이지 카테고리 하위분류명 테이블 action
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

	// 관리자 페이지 카테고리 하위분류명 테이블 list
	@RequestMapping(value = "/categoryManagementList", method = RequestMethod.POST, produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String categoryManagementListAjax(@RequestParam HashMap<String, String> params) throws Throwable {
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> model = new HashMap<String, Object>();

		
		// 페이지 받아오게 되어있음
		int cnt = dao.getIntData("cate.getCateCnt", params);				

		HashMap<String, Integer> pd = ips.getPagingData(Integer.parseInt(params.get("page")), cnt, 10, 5);
		

		System.out.println("params : " + params.toString());

		params.put("start", Integer.toString(pd.get("start")));
		params.put("end", Integer.toString(pd.get("end")));

		List<HashMap<String, String>> list = dao.getList("cate.getCateList", params);

		model.put("list", list);
		model.put("pd", pd);

		return mapper.writeValueAsString(model);
	}

	// 관리자 페이지 카테고리 분류명 테이블 list
	@RequestMapping(value = "/divManagementList", method = RequestMethod.POST, produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String divManagementListAjax(@RequestParam HashMap<String, String> params) throws Throwable {
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> model = new HashMap<String, Object>();

		// 페이지 받아오게 되어있음
		int cnt = dao.getIntData("div.getDivCnt", params);

		HashMap<String, Integer> pd = ips.getPagingData(Integer.parseInt(params.get("page1")), cnt, 10, 5);

		params.put("start", Integer.toString(pd.get("start")));
		params.put("end", Integer.toString(pd.get("end")));

		List<HashMap<String, String>> list = dao.getList("div.getDivList", params);

		model.put("list", list);
		model.put("pd", pd);

		return mapper.writeValueAsString(model);
	}

	// 관리자 페이지 카테고리 분류명 테이블 action
	@RequestMapping(value = "/divManagementAction/{gbn}", method = RequestMethod.POST, produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String divManagementActionAjax(@PathVariable String gbn, @RequestParam HashMap<String, String> params)
			throws Throwable {
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> model = new HashMap<String, Object>();

		int cnt = 0;

		try {
			switch (gbn) {
			case "insert":
				cnt = dao.insert("div.insertDiv", params);
				break;
			case "update":
				cnt = dao.update("div.updateDiv", params);
				break;
			case "delete":
				cnt = dao.update("div.deleteDiv", params);
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

	// 관리자 페이지 회원관리 목록화면
	@RequestMapping(value = "/memManagement")
	public ModelAndView memManagement(@RequestParam HashMap<String, String> params, ModelAndView mav) {

		int page = 1;// 첫페이지로 나타내려고

		if (params.get("page") != null && params.get("page") != "") {
			page = Integer.parseInt(params.get("page"));
		}
		// 페이지 번호
		mav.addObject("page", page);

		mav.setViewName("manager/memManagement");
		return mav;
	}

	// Ajax를 붙여야지 AOP에서 관리 안함.
	@RequestMapping(value = "/memManagementListAjax", method = RequestMethod.POST, produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String memManagementListAjax(@RequestParam HashMap<String, String> params) throws Throwable {
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> model = new HashMap<String, Object>();

		System.out.println("params : " + params.toString());

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
	
	// 관리자 페이지 데이터관리 목록화면
	@RequestMapping(value = "/autorityPopup")
	public ModelAndView autorityPopup(ModelAndView mav) {
		mav.setViewName("manager/autorityPopup");
		return mav;
	}

	
	@RequestMapping(value = "/memDetailAjax", method = RequestMethod.POST, produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String memDetailAjax(@RequestParam HashMap<String,String> params) throws Throwable{
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> model = new HashMap<String, Object>();
		
		System.out.println("(*)memDetailAjax : "+params.toString());

		HashMap<String, String> data = dao.getMapData("member.getMember", params);

		model.put("data", data);
		
		List<HashMap<String, String>> gbn = dao.getList("manager.autority", params);
		model.put("gbn", gbn);
		
		return mapper.writeValueAsString(model);
	}
	
	
	@RequestMapping(value = "/autoryUpdateAjax", method = RequestMethod.POST, produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String autoryUpdateAjax(ModelAndView mav, 	@RequestParam 	HashMap<String, String> params) throws Throwable {
		
		System.out.println("(*)autorityUpdate : "+params.toString());
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> model = new HashMap<String, Object>();
		int cnt = 0;
		cnt = dao.update("manager.autorityUpdate", params);
		
		if(cnt > 0) {
			model.put("msg", "success");
		}else {
			model.put("msg", "fail");
		}
		return mapper.writeValueAsString(model);
	}
	

	// 관리자 페이지 신고관리 목록화면
	@RequestMapping(value = "/reportReviewManagement")
	public ModelAndView reportReviewManagement(
			HttpSession session,
			@RequestParam HashMap<String,String> params,
			ModelAndView mav) {
		int page = 1;
		
		if(params.get("page")!=null && params.get("page")!="") {
		page = Integer.parseInt(params.get("page"));
		}
		mav.addObject("page",page);
		
		mav.setViewName("manager/reportReviewManagement");
		
		return mav;
	}
	@RequestMapping(value= "/reportReviewAjax",
			method = RequestMethod.POST,
			produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String reportReviewAjax(
			@RequestParam HashMap<String, String> params)throws Throwable{
			ObjectMapper mapper = new ObjectMapper();
			
			Map<String, Object> model = new HashMap<String,Object>();
			
			int cnt = dao.getIntData("reportreview.reportreviewCnt",params);
			
			HashMap<String, Integer> pd = ips.getPagingData(Integer.parseInt(params.get("page")),
					cnt,10,5);
			
			params.put("start", Integer.toString(pd.get("start")));
			params.put("end", Integer.toString(pd.get("end")));
		
			
			List<HashMap<String, String>> list = dao.getList("reportreview.List",params);
			
			model.put("list",list);
			model.put("pd",pd);
			
			return mapper.writeValueAsString(model);
		}
	@RequestMapping(value= "/reportReviewDetail")
	public ModelAndView QnaDetail(@RequestParam HashMap<String, String> params,
			ModelAndView mav) throws Throwable {
		
		if(params.get("no")!=null && params.get("no") != "") {
			
		
		HashMap<String, String>data = dao.getMapData("reportreview.getreportReview",params);
		
		mav.addObject("data",data);
		
		mav.setViewName("report/reportReviewManagementDetail1");
		}else {
			mav.setViewName("redirect:reportReviewManagement");
		}
		return mav;
	}
}
