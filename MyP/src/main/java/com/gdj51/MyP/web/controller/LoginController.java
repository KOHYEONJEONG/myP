package com.gdj51.MyP.web.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.gdj51.MyP.util.Utils;
import com.gdj51.MyP.web.dao.IACDao;

@Controller
public class LoginController {

	@Autowired
	public IACDao iACDao;

	@RequestMapping(value = "/header")
	public ModelAndView header(ModelAndView mav) {
		mav.setViewName("include/header");
		return mav;
	}

	@RequestMapping(value = "/header1")
	public ModelAndView header1(ModelAndView mav) {
		mav.setViewName("include/header1");
		return mav;
	}

	@RequestMapping(value = "/footer")
	public ModelAndView footer(ModelAndView mav) {
		mav.setViewName("include/footer");
		return mav;
	}

	@RequestMapping(value = "/login")
	public ModelAndView login(ModelAndView mav) {
		System.out.println("로그인 창 들어감.");
		mav.setViewName("login/login");
		return mav;
	}

	@RequestMapping(value = "/loginAjax", method = RequestMethod.POST, produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String testALoginAjax(HttpSession session, @RequestParam HashMap<String, String> params) throws Throwable {
		ObjectMapper mapper = new ObjectMapper();

		Map<String, Object> model = new HashMap<String, Object>();

		params.put("pw", Utils.encryptAES128(params.get("pw")));
		// System.out.println("테스트 비밀번호 암호화 : "+params.get("pw")); //1234 암호화

		HashMap<String, String> data = iACDao.getMapData("login.checkMem", params);

		if (data != null) {
			session.setAttribute("sMemNo", data.get("MEM_NUM"));
			session.setAttribute("sMemNm", data.get("NM"));
			session.setAttribute("sMemAuto", data.get("AUTORITY_NUM"));// 권한
			System.out.println("권한 : " + session.getAttribute("sMemAuto"));

			model.put("msg", "success");

		} else {
			model.put("msg", "failed");
		}

		return mapper.writeValueAsString(model);
	}

	@RequestMapping(value = "/idFind")
	public ModelAndView idFind(ModelAndView mav) {
		mav.setViewName("login/idFind");
		return mav;
	}

	@RequestMapping(value = "/pwFind")
	public ModelAndView pwFind(ModelAndView mav) {
		mav.setViewName("login/pwFind");
		return mav;
	}

	// 가져오고 변경되는게 없기 때문에 비동기 처리 X
	@RequestMapping(value = "/idFindResult")
	public ModelAndView idFindResult(@RequestParam HashMap<String, String> params, ModelAndView mav) throws Throwable {

		if (params.get("email") != null && params.get("email") != "") {

			HashMap<String, String> data = iACDao.getMapData("join.getId", params);

			mav.addObject("data", data);

			mav.setViewName("login/idFindResult");
		} else {
			mav.setViewName("redirect:idFind");
		}

		return mav;
	}

	// 가져오고 변경되는게 없기 때문에 비동기 처리 X
	@RequestMapping(value = "/pwChange")
	public ModelAndView pwChange(@RequestParam HashMap<String, String> params, ModelAndView mav) throws Throwable {

		if (params.get("email") != null && params.get("email") != "") {

			HashMap<String, String> data = iACDao.getMapData("join.getMemNum", params);

			mav.addObject("data", data);

			mav.setViewName("login/pwChange");
		} else {
			mav.setViewName("redirect:pwFind");
		}

		return mav;
	}

	@RequestMapping(value = "/logout")
	public ModelAndView logout(HttpSession session, ModelAndView mav) {
		session.invalidate();

		mav.setViewName("redirect:home");

		return mav;
	}

}
