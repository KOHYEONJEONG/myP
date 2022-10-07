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
public class BookmarkController {

	@Autowired
	public IACDao dao;

	// 문화생활 즐겨찾기 삽입, 수정
	@RequestMapping(value = "/cultureBookmarkAction/{gbn}", method = RequestMethod.POST, produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String cultureBookmarkAction(@PathVariable String gbn, @RequestParam HashMap<String, String> params)
			throws Throwable {
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> model = new HashMap<String, Object>();

		int cnt = 0;
		System.out.println("params" + params);

		try {
			switch (gbn) {
			case "insert":
				cnt = dao.insert("bookmark.insertCultrue", params);
				break;
			case "delete":
				cnt = dao.delete("bookmark.deleteCultrue", params);
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

	// 문화생활 즐겨찾기 리스트
	@RequestMapping(value = "/cultureBookmarkList", method = RequestMethod.POST, produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String cultureBookmarkListAjax(@RequestParam HashMap<String, String> params) throws Throwable {
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> model = new HashMap<String, Object>();

		System.out.println("bookmarkparams" + params);

		List<HashMap<String, String>> list = dao.getList("bookmark.getCultrueBookmarkList", params);

		model.put("list", list);

		return mapper.writeValueAsString(model);
	}

	// 영화관 즐겨찾기 삽입, 수정
	@RequestMapping(value = "/cinemaBookmarkAction/{gbn}", method = RequestMethod.POST, produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String cinemaBookmarkAction(@PathVariable String gbn, @RequestParam HashMap<String, String> params)
			throws Throwable {
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> model = new HashMap<String, Object>();

		int cnt = 0;
		System.out.println("params" + params);

		try {
			switch (gbn) {
			case "insert":
				cnt = dao.insert("bookmark.insertCinema", params);
				break;
			case "delete":
				cnt = dao.delete("bookmark.deleteCinema", params);
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

	// 영화관 즐겨찾기 리스트
	@RequestMapping(value = "/cinemaBookmarkList", method = RequestMethod.POST, produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String cinemaBookmarkListAjax(@RequestParam HashMap<String, String> params) throws Throwable {
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> model = new HashMap<String, Object>();

		System.out.println("bookmarkparams" + params);

		List<HashMap<String, String>> list = dao.getList("bookmark.getCinemaBookmarkList", params);

		model.put("list", list);

		return mapper.writeValueAsString(model);
	}

}
