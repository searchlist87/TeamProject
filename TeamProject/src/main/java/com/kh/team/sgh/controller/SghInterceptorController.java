package com.kh.team.sgh.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@RequestMapping("/sgh/interceptor")
public class SghInterceptorController {

	// 인터셉터에서 admin 클래스가 아닌데 관리자 페이지로 접근하여 발생하는 처리
	@RequestMapping(value="/admin", method=RequestMethod.GET)
	public String adminInterceptor(RedirectAttributes rttr) throws Exception {
		rttr.addFlashAttribute("result", "false");
		return "redirect:/";
	}
}
