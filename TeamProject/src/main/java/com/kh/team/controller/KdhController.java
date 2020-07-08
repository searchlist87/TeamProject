package com.kh.team.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/kdh")
public class KdhController {

	@RequestMapping(value = "/register", method = RequestMethod.GET)
	public void register() throws Exception {
		
	} 
	

}
