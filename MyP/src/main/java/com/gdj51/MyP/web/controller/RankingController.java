package com.gdj51.MyP.web.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class RankingController {

	@RequestMapping(value = "/rankingFeeReasonableBoard")
	public ModelAndView rankingFeeReasonableBoard(ModelAndView mav) {
		mav.setViewName("ranking/rankingFeeReasonableBoard");
		return mav;
	}

	@RequestMapping(value = "/rankingSystemGoodParking")
	public ModelAndView rankingSystemGoodParking(ModelAndView mav) {
		mav.setViewName("ranking/rankingSystemGoodParking");
		return mav;
	}

}
