package com.kh.team;

import java.util.Locale;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class HomeController {
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
<<<<<<< HEAD
		return "/templet/contact";
=======
<<<<<<< HEAD
		return "/templet/cart";
=======
		return "/templet/blog-single-sidebar";
>>>>>>> branch 'master' of https://github.com/searchlist87/TeamProject
>>>>>>> branch 'master' of https://github.com/searchlist87/TeamProject.git
	}
	
}
