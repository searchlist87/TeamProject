package com.kh.team.sgh;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/book")
public class SghBookController {
	
	@RequestMapping(value="/bookingView", method=RequestMethod.GET)
	public String testBookingView() throws Exception {
		return "user/sgh/book/bookingView";
	}
}
