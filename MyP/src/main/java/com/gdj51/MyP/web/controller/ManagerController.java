package com.gdj51.MyP.web.controller;

import java.sql.Array;
import java.util.ArrayList;
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

		HashMap<String, String> data = dao.getMapData("member.getMember", params);

		model.put("data", data);
		
		List<HashMap<String, String>> gbn = dao.getList("manager.autority", params);
		model.put("gbn", gbn);
		
		return mapper.writeValueAsString(model);
	}

	@RequestMapping(value = "/autoryUpdateAjax", method = RequestMethod.POST, produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String autoryUpdateAjax(ModelAndView mav, 	@RequestParam 	HashMap<String, String> params) throws Throwable {

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
	public ModelAndView reportReviewDetail(@RequestParam HashMap<String, String> params,
			ModelAndView mav) throws Throwable {

		if(params.get("review_num")!=null && params.get("review_num") != "") {
			HashMap<String, String>data = dao.getMapData("reportreview.getreportReview",params);
			mav.addObject("data",data);
			System.out.println("data===>"+data);
			mav.setViewName("report/reportReviewManagementDetail1");
		}else {
			System.out.println("data===>없음");
			mav.setViewName("redirect:reportReviewManagement");
		}
		return mav;
	}
	@RequestMapping(value= "/reportReviewDetail2")
	public ModelAndView reportReviewDetail2(@RequestParam HashMap<String, String> params,
			ModelAndView mav) throws Throwable {

		if(params.get("review_num")!=null && params.get("review_num") != "") {
			HashMap<String, String>data = dao.getMapData("reportreview.getreportReview",params);

			mav.addObject("data",data);

			mav.setViewName("report/reportReviewManagementDetail2");
		}else {
			mav.setViewName("redirect:reportReviewManagement");
		}
		return mav;
	}

	@RequestMapping(value= "/reportReviewaction/{gbn}",
			method = RequestMethod.POST,
			produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String reportReviewactionAjax(
			@PathVariable String gbn,
			@RequestParam HashMap<String,String> params) throws Throwable{
		
		ObjectMapper mapper = new ObjectMapper();
		HashMap<String, Object> model = new HashMap<String, Object>();

		int cnt = 0;

		try {
			switch(gbn) {
				case "update" :
					cnt = dao.update("reportreview.update",params);
					break;
				} 
			
			if(cnt>0) {
				model.put("result", "success");
			}else {
				model.put("result", "fail");
			}
			System.out.println(model.get("result"));
		}
		catch (Exception e) {
			model.put("result", "error");
			e.printStackTrace();
		}
		return mapper.writeValueAsString(model);
	}
	
	@RequestMapping(value= "/giveReport")
	public ModelAndView giveReport(@RequestParam HashMap<String, String> params,
			ModelAndView mav) throws Throwable {
		
		if(params.get("review_num")!=null && params.get("review_num") != "") {
			/* 멤버 데이터에 경고수 늘어 */
			dao.update("reportreview.updatereport",params);
			/* 관리자가 경고 줄때 관리자번호 데이터 넣어짐 */
			dao.update("reportreview.givereport",params);
		
		mav.setViewName("redirect:reportReviewDetail2");
		}
		return mav;
	}
	
	//가이드 관리자 페이지
	@RequestMapping(value = "/guideManagement")
	public ModelAndView guideManagement(@RequestParam HashMap<String, String> params,
			ModelAndView mav) throws Throwable {
		mav.setViewName("manager/guideManagerment");
		
		return mav;
	}
	
	
	
	//가이드 List Ajax - jsTree에 반영하고픔.
	@RequestMapping(value= "/managerGuideAjax",
			method = RequestMethod.POST,
			produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String managerGuideAjax(
			@RequestParam HashMap<String, String> params)throws Throwable{
		ObjectMapper mapper = new ObjectMapper();

		Map<String, Object> model = new HashMap<String,Object>();

		List<HashMap<String, String>> list = dao.getList("manager.manGuideList");

		model.put("list",list);
		
		return mapper.writeValueAsString(model);
	}
	
	//managerSelectAjax
	@RequestMapping(value = "/managerSelectAjax", method = RequestMethod.POST, produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String managerSelectAjax(ModelAndView mav, @RequestParam HashMap<String, String> params) throws Throwable {
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> model = new HashMap<String, Object>();
	
		HashMap<String, String> data =  dao.getMapData("manager.getGuide",params);
		model.put("data", data);
	
		return mapper.writeValueAsString(model);
	}
	
	//managerGuideAction
	@RequestMapping(value = "/managerGuideAction/{flag}", method = RequestMethod.POST, produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String managerGuideActionAjax(ModelAndView mav, @PathVariable String flag, @RequestParam HashMap<String, String> params) throws Throwable {
		ObjectMapper mapper = new ObjectMapper();

		Map<String, Object> model = new HashMap<String, Object>();

		int cnt = 0;

		try {
			switch (flag) {
			case "menuInsert"://메뉴등록
				cnt = dao.update("manager.insertMenu", params);
				break;
			case "conUpdate"://내용수정
				cnt = dao.update("manager.updateCon", params);
				break;
			case "menuUpdate"://메뉴이름 수정
				cnt = dao.update("manager.updateMenu", params);
				break;
			case "menuDelete"://삭제
				cnt = dao.delete("manager.deleteMenu", params);
				break;
			case "menuMove": //순서이동
				//siblings=5,6,7,112
				String[] si = params.get("siblings").split(",");//현재 형제들
				String[] oldSi = params.get("old_siblings").split(",");//과거 형제들
				
				if(!params.get("top_num").equals(params.get("old_top_num"))){//과거부모가 있다면(부모 자체를 바뀐다면)
					
					for(int i=0; i<si.length; i++) {
						params.put("pos", String.valueOf(i));
						params.put("siblings_num", si[i]);
						cnt = dao.update("manager.updateMenuPosition", params);
					}
					
					//과거 형제들 pos도 다시 변경해야되서.
					for(int i=0; i<oldSi.length; i++){
						if(params.get("guide_num").equals(oldSi[i])) {
							continue;
						}
						params.put("top_num", params.get("old_top_num"));
						params.put("pos", String.valueOf(i));
						params.put("siblings_num", oldSi[i]);
						cnt = dao.update("manager.updateMenuPosition", params);
					}
					
				}else {
					for(int i=0; i<si.length; i++){
						params.put("pos", String.valueOf(i));
						params.put("siblings_num", si[i]);
						cnt = dao.update("manager.updateMenuPosition", params);
					}
				}
				
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