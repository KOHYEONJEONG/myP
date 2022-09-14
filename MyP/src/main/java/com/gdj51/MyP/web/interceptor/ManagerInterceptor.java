package com.gdj51.MyP.web.interceptor;

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
		String cPath=request.getContextPath();
		String auto ="";
		
		if(session.getAttribute("sMemAuto")!=null) {
			auto = session.getAttribute("sMemAuto").toString();
		}else {
			auto = null;
		}
		
		System.out.println("(*)auto : "+auto );
		
		if(!auto.equals("1") || auto == null || auto.length() == 0) {
			System.out.println("관리자가 아닌 사람이 관리자 url에 접근했다!!!");
			response.sendRedirect(cPath+"/home");//contextpath를 작성해서 '절대 경로'로 이동
			return false;
		}
		
		return true;
	}
}
