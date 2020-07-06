package com.kh.team.jmh;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/jmh")
public class JmhController {

	@RequestMapping(value="/register", method = RequestMethod.GET)
	public void register() throws Exception {
		
	}
	
}
