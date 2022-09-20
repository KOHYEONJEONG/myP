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
public class PartiNoticeController {
	@Autowired
	public IACDao dao;

	@Autowired
	public IPagingService ips;

	// 공지사항 메뉴
	@RequestMapping(value = "/notice")
	public ModelAndView notice(@RequestParam HashMap<String, String> params, ModelAndView mav) {

		int page = 1;// 첫페이지로 나타내려고

		if (params.get("page") != null && params.get("page") != "") {
			page = Integer.parseInt(params.get("page"));
		}
		// 페이지 번호
		mav.addObject("page", page);

		mav.setViewName("partiNotice/notice");
		return mav;
	}

	// 공지사항 메뉴
	@RequestMapping(value = "/noticeRegister")
	public ModelAndView noticeRegister(@RequestParam HashMap<String, String> params, ModelAndView mav) {

		mav.setViewName("partiNotice/noticeRegister");
		return mav;
	}

	// 공지사항 메뉴 리스트
	@RequestMapping(value = "/noticeList", method = RequestMethod.POST, produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String noticeListAjax(@RequestParam HashMap<String, String> params) throws Throwable {
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> model = new HashMap<String, Object>();

		// 페이지 받아오게 되어있음
		int cnt = dao.getIntData("noti.getNoticeCnt", params);

		HashMap<String, Integer> pd = ips.getPagingData(Integer.parseInt(params.get("page")), cnt, 10, 5);

		params.put("start", Integer.toString(pd.get("start")));
		params.put("end", Integer.toString(pd.get("end")));

		List<HashMap<String, String>> list = dao.getList("noti.getNoticeList", params);

		model.put("list", list);
		model.put("pd", pd);

		return mapper.writeValueAsString(model);
	}

	// 가져오고 변경되는게 없기 때문에 비동기 처리 X
	@RequestMapping(value = "/noticeDetail")
	public ModelAndView noticeDetail(@RequestParam HashMap<String, String> params, ModelAndView mav) throws Throwable {
		// 글번호 안 넘어왔을때 처리
		if (params.get("no") != null && params.get("no") != "") {
			// 조회수
			dao.update("noti.updateNoticeHit", params);
			HashMap<String, String> data = dao.getMapData("noti.getNotice", params);

			mav.addObject("data", data);

			mav.setViewName("partiNotice/noticeDetail");
		} else {
			mav.setViewName("redirect:notice");
		}

		return mav;
	}

	@RequestMapping(value = "/noticeUpdate")
	public ModelAndView noticelUpdate(@RequestParam HashMap<String, String> params, ModelAndView mav) throws Throwable {
		// 글번호 안 넘어왔을때 처리
		if (params.get("no") != null && params.get("no") != "") {
			HashMap<String, String> data = dao.getMapData("noti.getNotice", params);

			mav.addObject("data", data);

			mav.setViewName("partiNotice/noticeUpdate");
		} else {
			mav.setViewName("redirect:noticeDetail");
		}

		return mav;
	}

	@RequestMapping(value = "/noticeAction/{gbn}", method = RequestMethod.POST, produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String noticeAction(@PathVariable String gbn, @RequestParam HashMap<String, String> params)
			throws Throwable {
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> model = new HashMap<String, Object>();

		int cnt = 0;

		try {
			switch (gbn) {
			case "insert":
				cnt = dao.insert("noti.insertNotice", params);
				break;
			case "update":
				cnt = dao.update("noti.updateNotice", params);
				break;
			case "delete":
				cnt = dao.delete("noti.deleteNotice", params);
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

	@RequestMapping(value = "/faq")
	public ModelAndView faq(@RequestParam HashMap<String, String> params, ModelAndView mav) {

		int page = 1;

		if (params.get("page") != null && params.get("page") != "") {
			page = Integer.parseInt(params.get("page"));
		}
		mav.addObject("page", page);

		mav.setViewName("partiNotice/faqList");

		return mav;
	}

	
	@RequestMapping(value = "/FaqList",
			method = RequestMethod.POST, 
			produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String FaqList(
			@RequestParam HashMap<String, String> params) throws Throwable {
		
		ObjectMapper mapper = new ObjectMapper();
		
		Map<String, Object> model = new HashMap<String, Object>();
		
		int cnt = dao.getIntData("faq.getFaqCnt", params);
		
		HashMap<String, Integer> pd = ips.getPagingData(Integer.parseInt(params.get("page")),
				cnt, 10, 5);

		params.put("start", Integer.toString(pd.get("start")));
		params.put("end", Integer.toString(pd.get("end")));
		
		List<HashMap<String, String>> list = dao.getList("faq.getFaqList", params);
		
		model.put("list", list);
		model.put("pd", pd);
		
		return mapper.writeValueAsString(model);
	}
	
	@RequestMapping(value = "/FaqInsert")
	public ModelAndView FaqRegister(@RequestParam HashMap<String, String> params, ModelAndView mav) {

		mav.setViewName("partiNotice/faqRegister");
		return mav;
	}
	
	@RequestMapping(value = "/faqAction/{gbn}", method = RequestMethod.POST, produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String faqAction(@PathVariable String gbn, @RequestParam HashMap<String, String> params)
			throws Throwable {
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> model = new HashMap<String, Object>();

		int cnt = 0;

		try {
			switch (gbn) {
			case "insert":
				cnt = dao.insert("faq.insertFaq", params);
				break;
			case "update":
				cnt = dao.update("faq.updateFaq", params);
				break;
			case "delete":
				cnt = dao.delete("faq.deleteFaq", params);
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
	
	
}
