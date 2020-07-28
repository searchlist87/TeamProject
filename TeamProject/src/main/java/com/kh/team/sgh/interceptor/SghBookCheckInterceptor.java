package com.kh.team.sgh.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.kh.team.domain.SghChoiceSeatDto;
import com.kh.team.domain.SghPaymentVo;

public class SghBookCheckInterceptor extends HandlerInterceptorAdapter {

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		HttpSession session = request.getSession();
		SghPaymentVo sghPaymentVo = (SghPaymentVo)session.getAttribute("sghPaymentVo");
		SghChoiceSeatDto sghChoiceSeatDto = (SghChoiceSeatDto)session.getAttribute("sghChoiceSeatDto");
		if(sghPaymentVo != null && sghChoiceSeatDto != null) {
			response.sendRedirect("/sgh/choiceSeat/paymentForm");
			return false;
		}
		return true;
	}
	
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		// TODO Auto-generated method stub
		super.postHandle(request, response, handler, modelAndView);
	}
}
