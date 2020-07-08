package com.kh.team;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.stereotype.Controller;

@Controller
@RequestMapping("/team")
public class MainController {

	// /sgh/register
		@RequestMapping(value="/register", method=RequestMethod.GET)
		public String register() throws Exception {
			return "templet/register";
		}
		
		@RequestMapping(value="/shop-grid", method=RequestMethod.GET)
		public String testShop() throws Exception {
			return "templet/shop-grid";
		}
		
		@RequestMapping(value="/checkout", method=RequestMethod.GET)
		public String testCheckout() throws Exception {
			return "templet/checkout";
		}
		
		@RequestMapping(value="/contact", method=RequestMethod.GET)
		public String testContact() throws Exception {
			return "templet/contact";
		}
		
		@RequestMapping(value="/food", method=RequestMethod.GET)
		public String testCart() throws Exception {
			return "templet/food-grid";
		}
		
		@RequestMapping(value="/blog-single-sidebar", method=RequestMethod.GET)
		public String testBlog_single_sidebar() throws Exception {
			return "templet/blog-single-sidebar";
		}
		
		// SghController
		@RequestMapping(value="/bookingView", method=RequestMethod.GET)
		public String testBookingView() throws Exception {
			return "redirect:/sgh/book/bookingView";
		}
}
