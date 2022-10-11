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
	@RequestMapping(value = "/bookmarkAction/{gbn}", method = RequestMethod.POST, produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String cultureBookmarkAction(@PathVariable String gbn, @RequestParam HashMap<String, String> params)
			throws Throwable {
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> model = new HashMap<String, Object>();

		int cnt = 0;
		System.out.println("params" + params);

		try {
			switch (gbn) {
			case "insertculture":
				cnt = dao.insert("bookmark.insertCultrue", params);
				break;
			case "deleteculture":
				cnt = dao.delete("bookmark.deleteCultrue", params);
				break;
			case "insertcinema":
				cnt = dao.insert("bookmark.insertCinema", params);
				break;
			case "deletecinema":
				cnt = dao.delete("bookmark.deleteCinema", params);
				break;
			case "insertgasStation":
				cnt = dao.insert("bookmark.insertGasstation", params);
				break;
			case "deletegasStation":
				cnt = dao.delete("bookmark.deletetGasstation", params);
				break;
			case "insertrestaurant":
				cnt = dao.insert("bookmark.insertRestaurant", params);
				break;
			case "deleterestaurant":
				cnt = dao.delete("bookmark.deletetRestaurant", params);
				break;
			case "insertparking":
				cnt = dao.insert("bookmark.insertParking", params);
				break;
			case "deleteparking":
				cnt = dao.delete("bookmark.deleteParking", params);
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

	// 주차장 즐겨찾기 리스트
	@RequestMapping(value = "/parkingBookmarkList", method = RequestMethod.POST, produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String parkingBookmarkListListAjax(@RequestParam HashMap<String, String> params) throws Throwable {
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> model = new HashMap<String, Object>();

		System.out.println("bookmarkparams" + params);

		List<HashMap<String, String>> list = dao.getList("bookmark.getParkingBookmarkList", params);

		model.put("list", list);

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

	// 주유소 즐겨찾기 리스트
	@RequestMapping(value = "/gasstationBookmarkList", method = RequestMethod.POST, produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String gasstationBookmarkListAjax(@RequestParam HashMap<String, String> params) throws Throwable {
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> model = new HashMap<String, Object>();

		System.out.println("bookmarkparams" + params);

		List<HashMap<String, String>> list = dao.getList("bookmark.getGasstationBookmarkList", params);

		model.put("list", list);

		return mapper.writeValueAsString(model);
	}

	// 음식점 즐겨찾기 리스트
	@RequestMapping(value = "/restaurantBookmarkList", method = RequestMethod.POST, produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String restaurantBookmarkListAjax(@RequestParam HashMap<String, String> params) throws Throwable {
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> model = new HashMap<String, Object>();

		System.out.println("bookmarkparams" + params);

		List<HashMap<String, String>> list = dao.getList("bookmark.getRestaurantBookmarkList", params);

		model.put("list", list);

		return mapper.writeValueAsString(model);
	}

}
