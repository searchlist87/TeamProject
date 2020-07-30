package com.kh.team.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/gsh/admin")
public class GshAdminController {
	
	@RequestMapping(value="/admin_movie_list", method = RequestMethod.GET)
	public String admin_movie_list() throws Exception {
		return "user/gsh/admin/admin_movie_list";
	}

}
