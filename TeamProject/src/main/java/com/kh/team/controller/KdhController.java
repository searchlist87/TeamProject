package com.kh.team.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/kdh/food")
public class KdhController {

	@RequestMapping(value = "/foodView", method = RequestMethod.GET)
	public String register() throws Exception {
		return "user/kdh/kdh_food/kdh_food-grid";
	} 
	

}
