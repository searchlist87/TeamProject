package com.kh.team.sgh;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/templet") // board 댓글
public class SgnController {

	@RequestMapping(value="/register", method=RequestMethod.GET)
	public void register() throws Exception {
		
	}
	
	@RequestMapping(value="/shop-grid", method=RequestMethod.GET)
	public void testShop() throws Exception {
		
	}
	
	@RequestMapping(value="/checkout", method=RequestMethod.GET)
	public void testCheckout() throws Exception {
		
	}
	
	@RequestMapping(value="/contact", method=RequestMethod.GET)
	public void testContact() throws Exception {
		
	}
	
	@RequestMapping(value="/cart", method=RequestMethod.GET)
	public void testCart() throws Exception {
		
	}
	
	@RequestMapping(value="/blog-single-sidebar", method=RequestMethod.GET)
	public void testBlog_single_sidebar() throws Exception {
		
	}
}
