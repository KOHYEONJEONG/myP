package com.gdj51.MyP.web.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.HandlerInterceptor;

public class LoginInterceptor implements HandlerInterceptor{

	  @Override
	    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
	            throws Exception {
	        //우리가 하고자 하는 작업은 Controller에 진입하기 전에 작업을 원하기 때문에 preHandle() 메서드를 오버 라이딩
		  	
		  System.out.println("LoginInterceptor preHandle 작동");
		  
		  HttpSession session = request.getSession();
		  session.invalidate();//세션을 제거해주는 코드
		  
	        return true;
	    }
}
