package com.kh.team.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/jmh/board")
public class JmhController {

	@RequestMapping(value="/register", method = RequestMethod.GET)
	public void register() throws Exception {
		
	}
	
}