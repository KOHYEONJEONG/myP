package com.gdj51.MyP.web.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

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
import com.gdj51.MyP.util.Utils;
import com.gdj51.MyP.web.dao.IACDao;

@Controller
public class MyPageController { // no

	@Autowired
	public IACDao dao;

	@Autowired
	public IPagingService ips;

	@RequestMapping(value = "/myPage")
	public ModelAndView mypage(ModelAndView mav, HttpSession session) throws Throwable {

		HashMap<String, String> params = new HashMap<String, String>();
		String no = String.valueOf(session.getAttribute("sMemNo"));// toString() x
		params.put("no", no);
		HashMap<String, String> data = dao.getMapData("member.getMember", params);

		mav.addObject("data", data);
		mav.setViewName("mypage/mypage");
		return mav;
	}

	// 사진부분만 비동기화
	@RequestMapping(value = "/memImgAjax", method = RequestMethod.POST, produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String memImgAjax(@RequestParam HashMap<String, String> params) throws Throwable {

		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> model = new HashMap<String, Object>();

		HashMap<String, String> data = dao.getMapData("member.getMemberImg", params);
		model.put("data", data);
		return mapper.writeValueAsString(model);// jsp에서 img만 받으면 됌.
	}

	@RequestMapping(value = "/memInfoUpdate")
	public ModelAndView memModify(HttpSession session,@RequestParam HashMap<String, String> params, ModelAndView mav) throws Throwable {
		// 개인정보 수정 페이지(no넘어옴)
		/*
		 * String no = String.valueOf(session.getAttribute("sMemNo"));// toString() x
		 * params.put("no", no); 
		 * HashMap<String, String> data = dao.getMapData("member.getMember", params);
		 * mav.addObject("data", data);
		 */
		mav.setViewName("mypage/mypageInfoUpdate");
		return mav;
	}

	@RequestMapping(value = "/memPwUpdate")
	public ModelAndView memPwUpdate(HttpSession session,@RequestParam HashMap<String, String> params, ModelAndView mav) throws Throwable {
		// 비밀번호 수정 페이지(no넘어옴)
		//String no = String.valueOf(session.getAttribute("sMemNo"));// toString() x
		//params.put("no", no);
		
		//HashMap<String, String> data = dao.getMapData("member.getMember", params);
		//mav.addObject("data", data);
		mav.setViewName("mypage/mypagePwUpdate");// no만 받으면 됌.
		return mav;
	}

	@RequestMapping(value = "/memAction/{gbn}", method = RequestMethod.POST, produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String memAction(@PathVariable String gbn, HttpSession session, @RequestParam HashMap<String, String> params)
			throws Throwable {
		ObjectMapper mapper = new ObjectMapper();

		Map<String, Object> model = new HashMap<String, Object>();

		int cnt = 0;
		try {
			switch (gbn) {
			case "insert":
				// cnt = dao.insert("member.boardInsert", params);
				break;

			case "update":
				// 비밀번호 수정 ..etc
				cnt = dao.update("member.memUpdate", params);
				break;

			case "delete":
				// 회원탈퇴
				cnt = dao.update("member.memWit", params);
				session.invalidate(); // 회원 탈퇴시 세션 초기화
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

	@RequestMapping(value = "/mypageReviewBoard")
	public ModelAndView mypageReviewBoard(ModelAndView mav, @RequestParam HashMap<String, String> params) {
		int page = 1;// 첫페이지로 나타내려고
		if (params.get("page") != null && params.get("page") != "") {
			page = Integer.parseInt(params.get("page"));
		}
		// 페이지 번호
		mav.addObject("page", page);
		mav.setViewName("mypage/mypageReviewBoard");
		return mav;
	}

	// 마이페이지 - 나의 리뷰게시판
	@RequestMapping(value = "/mypageReviewBoardAjax", method = RequestMethod.POST, produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String mypageReviewBoardAjax(ModelAndView mav, @RequestParam HashMap<String, String> params)
			throws Throwable {

		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> model = new HashMap<String, Object>();
		// 페이지 받아오게 되어있음
		int cnt = dao.getIntData("member.getMyReviewCnt", params);

		HashMap<String, Integer> pd = ips.getPagingData(Integer.parseInt(params.get("page")), cnt, 10, 5);

		params.put("start", Integer.toString(pd.get("start")));
		params.put("end", Integer.toString(pd.get("end")));

		List<HashMap<String, String>> list = dao.getList("member.myReviewList", params);

		model.put("list", list);
		model.put("pd", pd);

		return mapper.writeValueAsString(model);
	}

	// 나의 리뷰 상세페이지
	@RequestMapping(value = "/myReviewDetail")
	public ModelAndView myReviewDetail(ModelAndView mav, @RequestParam HashMap<String, String> params)
			throws Throwable {
		System.out.println("myReviewDetail : " + params.toString());

		// review_num <--넘겨받음
		HashMap<String, String> data = dao.getMapData("member.getMyReview", params);
		mav.addObject("data", data);

		mav.setViewName("mypage/myReviewDetail");
		return mav;
	}

	// mypageReviewUpdate
	@RequestMapping(value = "/mypageReviewUpdate")
	public ModelAndView mypageReviewUpdate(ModelAndView mav, @RequestParam HashMap<String, String> params)
			throws Throwable {
		System.out.println("(*)mypageReviewUpdate===> " + params.toString());

		// review_num <--넘겨받음
		HashMap<String, String> data = dao.getMapData("member.getMyReview", params);
		mav.addObject("data", data);

		mav.setViewName("mypage/myReviewUpdate");
		return mav;
	}

	@RequestMapping(value = "/myReviewAction/{gbn}", method = RequestMethod.POST, produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String myReviewActionAjax(@PathVariable String gbn, @RequestParam HashMap<String, String> params)
			throws Throwable {
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> model = new HashMap<String, Object>();

		System.out.println();

		int cnt = 0;

		try {
			switch (gbn) {
			case "update":
				cnt = dao.update("member.updateMyreview", params);
				break;
			case "delete":
				cnt = dao.update("member.deleteMyreview", params);
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

	// 마이페이지 QnA BOARD
	@RequestMapping(value = "/myQnA")
	public ModelAndView myQnA(ModelAndView mav, @RequestParam HashMap<String, String> params) {

		System.out.println("(*)myQnA===> " + params.get("page"));
		int page = 1;// 첫페이지로 나타내려고

		if (params.get("page") != null && params.get("page") != "") {
			page = Integer.parseInt(params.get("page"));
		}
		// 페이지 번호
		mav.addObject("page", page);

		mav.setViewName("mypage/mypageQnaBoard");
		return mav;
	}

	// 마이페이지 - 나의 Qna게시판
	@RequestMapping(value = "/mypageQnaBoardAjax", method = RequestMethod.POST, produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String mypageQnaBoardAjax(ModelAndView mav, @RequestParam HashMap<String, String> params) throws Throwable {
		System.out.println("mypageQnaBoardAjax : " + params.toString());

		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> model = new HashMap<String, Object>();

		// 페이지 받아오게 되어있음
		int cnt = dao.getIntData("member.qnaListCnt", params);

		HashMap<String, Integer> pd = ips.getPagingData(Integer.parseInt(params.get("page")), cnt, 10, 5);

		params.put("start", Integer.toString(pd.get("start")));
		params.put("end", Integer.toString(pd.get("end")));

		List<HashMap<String, String>> list = dao.getList("member.qnaList", params);

		model.put("list", list);
		model.put("pd", pd);

		return mapper.writeValueAsString(model);
	}

	@RequestMapping(value = "/myQnADetail")
	public ModelAndView myQnADetail(ModelAndView mav, @RequestParam HashMap<String, String> params) throws Throwable {
		HashMap<String, String> data = dao.getMapData("member.getQnaList", params);
		mav.addObject("data", data);
		mav.setViewName("mypage/myQnaDetail");
		return mav;
	}

	@RequestMapping(value = "/myQnAUpdate")
	public ModelAndView myQnAUpdate(ModelAndView mav, @RequestParam HashMap<String, String> params) throws Throwable {
		System.out.println("myQnAUpdate 들어옴");

		HashMap<String, String> data = dao.getMapData("member.getQnaList", params);
		mav.addObject("data", data);
		mav.setViewName("mypage/myQnaUpdate");
		return mav;
	}

	@RequestMapping(value = "/myQnaAction/{gbn}", method = RequestMethod.POST, produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String myQnaAction(@PathVariable String gbn, @RequestParam HashMap<String, String> params) throws Throwable {
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> model = new HashMap<String, Object>();
		System.out.println();
		int cnt = 0;

		try {
			switch (gbn) {
			case "update":
				cnt = dao.update("qna.update", params);
				break;
			case "delete":
				cnt = dao.update("qna.delete", params);
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

	//회원탈퇴 사유
	@RequestMapping(value = "/memWitReasonAjax", method = RequestMethod.POST, produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String memWitReasonAjax(@RequestParam HashMap<String, String> params) throws Throwable {

		System.out.println("memWitReasonAjax ==>" + params.toString());

		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> model = new HashMap<String, Object>();

		List<HashMap<String, String>> list = dao.getList("member.memWitReason");
		model.put("list", list);
		return mapper.writeValueAsString(model);// jsp에서 img만 받으면 됌.
	}
	
	// 회원탈퇴
	@RequestMapping(value = "/withdraw")
	public ModelAndView withdraw(ModelAndView mav, @RequestParam HashMap<String, String> params) {

		// no를 받아와서 이동
		mav.addObject("no", params.get("no"));

		// 회원탈퇴
		mav.setViewName("mypage/withdraw");
		return mav;
	}

	// 회원 탈퇴시 비밀번호 일치여부 체크
	@RequestMapping(value = "/pwdChackAjax", method = RequestMethod.POST)
	@ResponseBody
	public String pwdChackAjax(@RequestParam HashMap<String, String> params) throws Throwable {

		params.put("pw", Utils.encryptAES128(params.get("pwd")));

		// 비밀번호 중복체크
		int result = dao.memberCheck("join.pwdChackAjax", params);

		if (result == 1) {
			return "success"; // 비밀번호 일치
		} else {
			return "fail";
		}

	}

}
