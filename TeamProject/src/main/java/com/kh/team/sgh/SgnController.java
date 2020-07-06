package com.kh.team.sgh;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/sgh")
public class SgnController {

	@RequestMapping(value="/register", method=RequestMethod.GET)
	public void register() throws Exception {
		
	}
}
