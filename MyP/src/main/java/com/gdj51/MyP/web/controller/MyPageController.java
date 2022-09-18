package com.gdj51.MyP.web.controller;

import java.util.HashMap;
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
import com.gdj51.MyP.web.dao.IACDao;

@Controller
public class MyPageController {
	
	@Autowired
	public IACDao dao;

	@RequestMapping(value = "/myPage")
	public ModelAndView mypage(ModelAndView mav, HttpSession session) throws Throwable {
		
		HashMap<String, String> params = new HashMap<String, String>();
		String no = String.valueOf(session.getAttribute("sMemNo"));
		params.put("no",no);
		System.out.println("no===>"+params.get(no));
		
		HashMap<String, String> data = dao.getMapData("member.getMember",params);

		mav.addObject("data", data);
		mav.setViewName("mypage/mypage");
		return mav;
	}
	
	@RequestMapping(value = "/memModify")
	public ModelAndView memModify(@RequestParam HashMap<String, String> params, ModelAndView mav, HttpSession session) throws Throwable {
		//개인정보 수정 페이지(no넘어옴)
		HashMap<String, String> data = dao.getMapData("member.getMember",params);
		mav.addObject("data", data);
		mav.setViewName("mypage/memModify");
		return mav;
	}
	
	 @RequestMapping(value="/memAction/{gbn}",
	         method = RequestMethod.POST,
	         produces = "text/json;charset=UTF-8")
	   @ResponseBody
	   public String ATAction(
	         @PathVariable String gbn,
	         @RequestParam HashMap<String, String> params) throws Throwable{
	      ObjectMapper mapper = new ObjectMapper();
	      
	      Map<String, Object> model = new HashMap<String, Object>();
	      
	      int cnt = 0;
	      try {
	         switch (gbn) {
	         case "insert": 
	        	 cnt = dao.insert("T.tBoardInsert", params);
	            break;
	            
	         case "update": 
	        	 cnt = dao.update("T.tBoardUpdate", params);
	            break;
	            
	         case "delete": 
	        	 cnt = dao.update("T.tBoardDelete", params);
	            break;
	         }
	         
		         if(cnt > 0) {
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
