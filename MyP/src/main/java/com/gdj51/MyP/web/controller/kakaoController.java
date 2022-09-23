package com.gdj51.MyP.web.controller;

import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.gdj51.MyP.web.service.IKakaoLoginService;

@Controller
public class kakaoController {

	@Autowired
	public IKakaoLoginService iKakaoS;

	// 1번 카카오톡에 사용자 코드 받기(jsp의 a태그 href에 경로 있음)
	// 2번 받은 code를 iKakaoS.getAccessToken로 보냄 ###access_Token####로 찍어서 잘 나오면은 다음단계진행
	// 3번 받은 access_Token를 iKakaoS.getUserInfo로 보냄 userInfo받아옴, userInfo에
	// nickname, email정보가 담겨있음
	// (우리는 email 정보만을 사용하고 있기 때문에, nickname 필요없긴 함)
	// 4번 params에 email정보 넣어줌
	// 5번 params를 가지고 db에서 member테이블에 같은 이메일 있는지 확인, 있으면 멤버의 정보 가져와서 data로 받음
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
			// mav.addObject("email", userInfo.get("email"));
			// mav.setViewName("/logout");
		}
		return mav;

	}

	// 카카오ID로 가입하기, jsp, 우선은 화면 css만 볼려고, 넣어준거임, 따로 url은 없을예정
	// 카카오ID(=email)없으면 못 넘어오게 막아야함
//	@RequestMapping(value = "/KakaoJoin")
//	public ModelAndView KakaoJoin(ModelAndView mav) {
//		mav.setViewName("join/kakaoJoin");
//		return mav;
//	}

	/*
	 * @RequestMapping(value = "/logout") public String access(HttpSession session)
	 * throws Throwable {
	 * 
	 * String access_token = (String)session.getAttribute("access_token");
	 * Map<String, String> map = new HashMap<String, String>();
	 * map.put("Authorization", "Bearer "+ access_token);
	 * 
	 * String reqURL = "https://kapi.kakao.com/v1/user/logout";
	 * 
	 * URL url = new URL(reqURL);
	 * 
	 * HttpURLConnection conn = (HttpURLConnection) url.openConnection();
	 * 
	 * return "redirect:/";
	 * 
	 * }
	 */

}