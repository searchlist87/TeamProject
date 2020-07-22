package com.kh.team.sgh.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class SghAdminInterceptor extends HandlerInterceptorAdapter {

	// 세션에 로그인이 담겨있지 않은 상태면 로그인 폼으로
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		HttpSession session = request.getSession();
		String user_class = (String)session.getAttribute("user_class");
		System.out.println("class :" + user_class);
		if(!user_class.equals("admin")) {
			response.sendRedirect("/sgh/interceptor/admin");
			return false;
		}
		return true;
	}
	
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		super.postHandle(request, response, handler, modelAndView);
	}
}
