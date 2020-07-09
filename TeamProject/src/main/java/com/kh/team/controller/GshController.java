package com.kh.team.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/gsh/movie")
public class GshController {
	
	@RequestMapping(value = "/review", method = RequestMethod.GET)
	public String shopGrid() throws Exception {
//		System.out.println("movie");
		return "user/gsh/movie/review";
	}

}
