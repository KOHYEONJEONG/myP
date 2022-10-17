package com.gdj51.MyP;

import java.util.HashMap;
import java.util.List;
import java.util.Locale;
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
import com.gdj51.MyP.web.dao.IACDao;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {

	@Autowired
	public IACDao iACDao;

	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = { "/", "/home" }, method = RequestMethod.GET)
	public ModelAndView home(Locale locale, ModelAndView modelAndView) {

		modelAndView.setViewName("home");

		return modelAndView;
	}

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

		ObjectMapper mapper = new ObjectMapper();

		Map<String, Object> model = new HashMap<String, Object>();

		List<HashMap<String, String>> reviewlist = iACDao.getList("home.ReviewwList", params);

		model.put("reviewlist", reviewlist);

		/* model.put("popuplist", popuplist); */
		return mapper.writeValueAsString(model);

	}

	@RequestMapping(value = "/HomeAction/{gbn}", method = RequestMethod.POST, produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String HomeAction(@PathVariable String gbn, @RequestParam HashMap<String, String> params) throws Throwable {
		ObjectMapper mapper = new ObjectMapper();

		Map<String, Object> model = new HashMap<String, Object>();

		int cnt = 0;

		try {
			switch (gbn) {
			case "insert":
				cnt = iACDao.insert("home.insertReport", params);// 신고
				break;
			case "insertreview":
				cnt = iACDao.insert("home.insertreview", params);// 리뷰
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

	/* 현재위치에 최단거리 주차장 5개 */
	@RequestMapping(value = "/shortDistanceAjax", method = RequestMethod.POST, produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String shortDistanceAjax(@RequestParam HashMap<String, String> params) throws Throwable {
		ObjectMapper mapper = new ObjectMapper();

		Map<String, Object> model = new HashMap<String, Object>();

		List<HashMap<String, String>> list = iACDao.getList("home.getShortDistance", params);

		model.put("list", list);

		return mapper.writeValueAsString(model);

	}

	// 위치:home , 금액표 상세보기(요금비교 사이드바)
	@RequestMapping(value = "/parkDetail", method = RequestMethod.POST, produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String parkDetailAjax(@RequestParam HashMap<String, String> params) throws Throwable {

		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> model = new HashMap<String, Object>();

		HashMap<String, String> data = iACDao.getMapData("home.getFeelist", params);
		model.put("data", data);
		return mapper.writeValueAsString(model); // 결과값으로 발송번호 받기
	}

	// 위치:home , 리뷰 사이드바 글쓰기 팝업
	@RequestMapping(value = "/reviewPopup2")
	public ModelAndView reviewPopup2(ModelAndView mav) {
		mav.setViewName("review/reviewPopup");
		return mav;
	}

	// calc_wrap
	@RequestMapping(value = "calc_wrap")
	public ModelAndView calc_wrap(ModelAndView mav) {
		mav.setViewName("side/acc");
		return mav;
	}

	// 위치:home , 금액표 상세보기(요금비교 사이드바)
	@RequestMapping(value = "/parkFeeDetail", method = RequestMethod.POST, produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String parkFeeDetailAjax(@RequestParam HashMap<String, String> params) throws Throwable {

		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> model = new HashMap<String, Object>();

		HashMap<String, String> data = iACDao.getMapData("home.getFeelist", params);
		model.put("data", data);
		return mapper.writeValueAsString(model); // 결과값으로 발송번호 받기
	}

}
