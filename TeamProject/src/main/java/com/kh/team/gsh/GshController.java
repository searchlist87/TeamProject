package com.kh.team.gsh;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/gsh/board")
public class GshController {
	
	@RequestMapping(value = "/register" , method = RequestMethod.GET)
	public void register() throws Exception {
		
	}

}
