package com.gdj51.MyP.web.controller;

import java.util.HashMap;
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
import com.gdj51.MyP.util.Utils;
import com.gdj51.MyP.web.dao.IACDao;
import com.gdj51.MyP.web.service.IJoinService;

@Controller
public class JoinController {

	@Autowired
	public IJoinService mailService;

	@Autowired
	public IACDao dao;

	private static final Logger logger = LoggerFactory.getLogger(JoinController.class);

	@RequestMapping(value = "/join")
	public ModelAndView jInsert(ModelAndView mav) {// 회원가입
		mav.setViewName("/join/join");

		return mav;
	}

	// 아이디 중복 체크
	@RequestMapping(value = "/checkIdAjax", method = RequestMethod.POST)
	@ResponseBody
	public String checkIdAjax(@RequestParam HashMap<String, String> params) throws Throwable {

		logger.info("checkIdAjax() 진입");

		// 아이디 중복체크
		int result = dao.memberCheck("join.idCheck", params);

		logger.info("결과값 : " + result);

		if (result != 0) {
			return "fail";// 중복 아이디가 존재
		} else {
			return "success";
		}

	}

	// 이메일 중복 체크 (가입된 이메일인지 체크)
	@RequestMapping(value = "/checkEmailAjax", method = RequestMethod.POST)
	@ResponseBody
	public String checkEmailAjax(@RequestParam HashMap<String, String> params) throws Throwable {

		logger.info("checkEmailAjax() 진입");

		// 아이디 중복체크
		int result = dao.memberCheck("join.emailCheck", params);

		logger.info("결과값 : " + result);

		if (result == 1) {
			return "success";// 중복 이메일이 존재
		} else {
			return "fail";
		}

	}

	// 이메일, 아이디 일치여부 체크
	@RequestMapping(value = "/idEmailChackAjax", method = RequestMethod.POST)
	@ResponseBody
	public String idEmailChackAjax(@RequestParam HashMap<String, String> params) throws Throwable {

		logger.info("idEmailChackAjax() 진입");

		// 아이디 중복체크
		int result = dao.memberCheck("join.idEmailCheck", params);

		logger.info("결과값 : " + result);

		if (result == 1) {
			return "success";// 이메일, 아이디 일치
		} else {
			return "fail";
		}

	}

	// 해당 메일에 인증번호 이메일 전송 + 인증번호 테이블에 데이터 생성, 회원가입시에 적용
	@RequestMapping(value = "/mailSend", method = RequestMethod.GET, produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String mailSend(@RequestParam HashMap<String, String> params) throws Throwable {
		System.out.println("이메일 :" + params);

		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> model = new HashMap<String, Object>();

		int send_num = mailService.joinEmail(params.get("email"));
		model.put("send_num", send_num);

		System.out.println("발송번호 : " + send_num);

		return mapper.writeValueAsString(model); // 결과값으로 발송번호 받기
	}

	// 작성한 인증번호가 맞는지 체크('send_num'과 '사용자가 작성한 인증번호'를 받아온다)
	@RequestMapping(value = "/mailCheck", method = RequestMethod.GET)
	@ResponseBody
	public String mailCheck(@RequestParam HashMap<String, String> params) throws Throwable {
		System.out.println("인증번호 체크 params ===>" + params.toString());

		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> model = new HashMap<String, Object>();

		// count를 하여 1이면 성공,
		int cnt = dao.getIntData("join.mailAuteCheck", params);

		if (cnt > 0) {
			model.put("msg", "success");
		} else {
			model.put("msg", "fail");
		}

		return mapper.writeValueAsString(model);
	}

	// 가입하기
	@RequestMapping(value = "/JAction/{gbn}", method = RequestMethod.POST, produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String JAction(@PathVariable String gbn, @RequestParam HashMap<String, String> params) throws Throwable {
		ObjectMapper mapper = new ObjectMapper();

		Map<String, Object> model = new HashMap<String, Object>();
		int cnt = 0;
		try {
			switch (gbn) {
			case "insert":
				// 암호화
				params.put("pwd", Utils.encryptAES128(params.get("pwd")));
				System.out.println("회원가입 param : " + params.toString());

				String email = params.get("account") + '@' + params.get("domain");

				params.put("email", email);

				cnt = dao.insert("join.joinInsert", params);
				break;
			case "update":
				params.put("pwd", Utils.encryptAES128(params.get("pwd")));

				cnt = dao.update("join.joinUpdate", params);
				break;

			}
			if (cnt > 0) {
				model.put("msg", "success");
			} else {
				model.put("msg", "fail");
			}

			System.out.println("msg(join)-=>" + model.get("msg"));
		} catch (Exception e) {
			e.printStackTrace();
			model.put("msg", "error");
		}
		return mapper.writeValueAsString(model);
	}

}
