package com.kh.team;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.stereotype.Controller;

@Controller
@RequestMapping("/team")
public class MainController {

		
		// SghController
		@RequestMapping(value="/bookingView", method=RequestMethod.GET)
		public String testBookingView() throws Exception {
			return "redirect:/sgh/book/bookingView";
		}
		
		// JmhController
		@RequestMapping(value="/theaterView", method = RequestMethod.GET)
		public String theaterView() throws Exception {
			return "redirect:/jmh/theater/theaterView";
		}
}
