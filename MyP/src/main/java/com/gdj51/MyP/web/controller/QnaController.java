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
import com.gdj51.MyP.web.dao.IACDao;


@Controller
public class QnaController {

	@Autowired
	public IACDao iACDao;
	
	@Autowired
	public IPagingService ips;
	
	@RequestMapping(value= "/qna")
	public ModelAndView qna(
			HttpSession session,
			@RequestParam HashMap<String,String> params,
			ModelAndView mav) {
		int page = 1;
		
		if(params.get("page")!=null && params.get("page")!="") {
		page = Integer.parseInt(params.get("page"));
		}
		mav.addObject("page",page);
		
		mav.setViewName("partiNotice/quaBoard");
		
		return mav;
	}
	
	@RequestMapping(value= "/QnaAjax",
			method = RequestMethod.POST,
			produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String QnaListAjax(
		@RequestParam HashMap<String, String> params)throws Throwable{
		ObjectMapper mapper = new ObjectMapper();
		
		Map<String, Object> model = new HashMap<String,Object>();
		
		int cnt = iACDao.getIntData("qna.qnaCnt",params);
		
		HashMap<String, Integer> pd = ips.getPagingData(Integer.parseInt(params.get("page")),
				cnt,10,5);
		
		params.put("start", Integer.toString(pd.get("start")));
		params.put("end", Integer.toString(pd.get("end")));
	
		
		List<HashMap<String, String>> list = iACDao.getList("qna.List",params);
		
		model.put("list",list);
		model.put("pd",pd);
		
		return mapper.writeValueAsString(model);
	}
	
	@RequestMapping(value= "/QnaDetail")
	public ModelAndView QnaDetail(@RequestParam HashMap<String, String> params,
			ModelAndView mav) throws Throwable {
		
		if(params.get("no")!=null && params.get("no") != "") {
		
			iACDao.update("qna.updateHit",params);
		
			HashMap<String, String>data = iACDao.getMapData("qna.getqna",params);
			
			mav.addObject("data",data);
			
			mav.setViewName("partiNotice/qnaDetail");
		}else {
			mav.setViewName("redirect:qna");
		}
		return mav;
	}
	@RequestMapping(value= "/QnaAction/{gbn}",
			method = RequestMethod.POST,
			produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String QnaAction(
			@PathVariable String gbn,
			@RequestParam HashMap<String,String> params) throws Throwable{
		ObjectMapper mapper = new ObjectMapper();
		
		Map<String, Object> model = new HashMap<String,Object>();
		
		int cnt = 0;
		
		try {
			switch(gbn) {
			case "insert" : cnt = iACDao.insert("qna.insert",params);
				break;
			case "update" :	cnt = iACDao.update("qna.update",params);
				break;
			case "delete" :	cnt = iACDao.update("qna.delete",params);
				break;
		} 
			if(cnt>0) {
				model.put("msg", "success");
			}else {
				model.put("msg", "fail");
			}
		}
			catch (Exception e) {
			e.printStackTrace();
			model.put("msg", "error");
		}
		return mapper.writeValueAsString(model);
	}
		
	 //AOBAction
    @RequestMapping(value="/qnaDetail/{gbn}",
             method = RequestMethod.POST,
             produces = "text/json;charset=UTF-8")
    @ResponseBody
    public String AOBAction(HttpSession session,
                      @PathVariable String gbn,
                      @RequestParam HashMap<String, String> params) throws Throwable {
       
       ObjectMapper mapper = new ObjectMapper();
       
       Map<String, Object> model = new HashMap<String, Object>();
       
       int cnt = 0;
       
       try {
          switch (gbn) {
          case "insert":
                cnt = iACDao.update("qna.commentinsert", params);
             break;
         
          }
          
          if(cnt > 0) {
             model.put("msg", "success");
          }else {
             model.put("msg", "fail");
          }
          
       }catch (Exception e) {
          e.printStackTrace();
          model.put("msg","error");
       }
       
       return mapper.writeValueAsString(model);
    }

    @RequestMapping(value = "/qnaInsert")
	public ModelAndView qnaInsert(ModelAndView mav) {
		mav.setViewName("partiNotice/qnaRegister");
		return mav;
	}
    
    @RequestMapping(value= "/qnaUpdate")
	public ModelAndView aTUpdate(@RequestParam HashMap<String, String> params,
			ModelAndView mav) throws Throwable {
		
		if(params.get("no")!=null && params.get("no") != "") {
			HashMap<String, String>data = iACDao.getMapData("qna.getqna",params);
			mav.addObject("data",data);
			
			mav.setViewName("partiNotice/qnaUpdate");
		}else {
			mav.setViewName("redirect:qna");
		}
		return mav;
	}
}
