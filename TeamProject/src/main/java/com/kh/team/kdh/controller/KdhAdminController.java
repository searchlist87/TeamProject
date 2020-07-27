package com.kh.team.kdh.controller;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Repository;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.kh.team.kdh.service.KdhFoodCartService;
import com.kh.team.kdh.service.KdhFoodService;

@RequestMapping("/kdh/admin")
@Controller
public class KdhAdminController {

	@Inject
	private KdhFoodService foodService;
	@Inject
	private KdhFoodCartService cartService;
	
	
	@RequestMapping(value = "/admin_food_form", method = RequestMethod.GET)
	public String admin_food_form() throws Exception {
		return "user/kdh/kdh_admin/kdh_admin_food_form";
	}
	
	@RequestMapping(value = "/admin_food_list", method = RequestMethod.GET)
	public String admin_food_list() throws Exception {
		return "user/kdh/kdh_admin/kdh_admin_food_form";
	}
	
	@RequestMapping(value = "/admin_food_register", method = RequestMethod.GET)
	public String admin_food_register() throws Exception {
		return "user/kdh/kdh_admin/kdh_admin_food_register";
	}
}
