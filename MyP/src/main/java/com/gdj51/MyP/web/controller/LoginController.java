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
import com.gdj51.MyP.web.service.IKakaoLoginService;

@Controller
public class LoginController {

	@Autowired
	public IACDao iACDao;

	@Autowired
	public IKakaoLoginService iKakaoS;

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

	// 1번 카카오톡에 사용자 코드 받기(jsp의 a태그 href에 경로 있음)
	// 2번 받은 code를 iKakaoS.getAccessToken로 보냄 ###access_Token####로 찍어서 잘 나오면은 다음단게진행
	// 3번 받은 access_Token를 iKakaoS.getUserInfo로 보냄 userInfo받아옴, userInfo에
	// nickname, email정보가 담겨있음
	// (우리는 email 정보만을 사용하고 있기 때문에, nickname 필요없긴 함)
	// 4번 params에 email정보 넣어줌
	// 5번 params를 가지고 db에서 member 정보 가져와서 data로 받음
	// 6번 data가 있으면 session에 넣어주고, 로그인 된 상태로 홈으로 이동
	// 7번 없으면은 다시 login화면으로 이동 (가입된 내역이 없다고 팝업뜨거나 그렇게 변경할 예정)
	// 참고: 카카오 간편 로그인 api는 단지 사용자의 정보만 우리한테 넘겨주는거임, 그 정보로, 자체 회원가입이나 로그인을 따로 구현해야 한다
	@RequestMapping(value = "/kakaoLogin", method = RequestMethod.GET)
	public ModelAndView kakaoLogin(HttpSession session, @RequestParam(value = "code", required = false) String code,
			ModelAndView mav) throws Throwable {

		// 1번
		System.out.println("#########" + code);

		// 2번
		String access_Token = iKakaoS.getAccessToken(code);
		System.out.println("###access_Token#### : " + access_Token);
		// 위의 access_Token 받는 걸 확인한 후에 밑에 진행

		// 3번
		HashMap<String, Object> userInfo = iKakaoS.getUserInfo(access_Token);
		System.out.println("###nickname#### : " + userInfo.get("nickname"));
		System.out.println("###email#### : " + userInfo.get("email"));

		// 4번
		HashMap<String, String> params = new HashMap<String, String>();
		params.put("email", userInfo.get("email").toString());

		// 5번
		HashMap<String, String> data = iKakaoS.getMapData("login.kakaocheckMem", params);

		// 6번
		if (data != null) {
			session.setAttribute("sMemNo", data.get("MEM_NUM"));
			session.setAttribute("sMemNm", data.get("NM"));
			session.setAttribute("sMemAuto", data.get("AUTORITY_NUM"));

			mav.setViewName("redirect:home");
		} else {
			// 7번
			mav.setViewName("login/login");
		}
		return mav;

	}

}
