package com.gdj51.MyP.web.interceptor;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.HandlerInterceptor;

import com.gdj51.MyP.web.dao.IACDao;

public class ManagerInterceptor  implements HandlerInterceptor{
	
	@Autowired
	public IACDao dao;
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {

		HttpSession session = request.getSession();
		HashMap<String, String> params = new HashMap<String, String>();
		params.put("sMemAuto",(String)session.getAttribute("sMemAuto"));
		
		try {
			if(params == null || dao.memberCheck("manager.managerCk", params) == 0) {//관리자 계정이 아닌경우
				
			}
		} catch (Throwable e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return true;
	}
}
