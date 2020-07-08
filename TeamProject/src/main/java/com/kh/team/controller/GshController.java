package com.kh.team.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/gsh/board")
public class GshController {
	
	@RequestMapping(value = "/register" , method = RequestMethod.GET)
	public void register() throws Exception {
		
	}
	@RequestMapping(value = "/shop-grid", method = RequestMethod.GET)
	public void shopGrid() throws Exception {
		System.out.println("shopGrid");
	}

}
