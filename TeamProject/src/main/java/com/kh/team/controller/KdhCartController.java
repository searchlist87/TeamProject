package com.kh.team.controller;


import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.team.domain.KdhFoodCartDto;
import com.kh.team.domain.KdhFoodVo;
import com.kh.team.service.KdhFoodCartService;
import com.kh.team.service.KdhFoodService;

@RequestMapping("/cart")
@Controller
public class KdhCartController {
	
	@Inject
	KdhFoodCartService cartService;
	@Inject
	KdhFoodService foodService;
	
	// 카트 메인 페이지
	@RequestMapping(value = "/displayCart", method = RequestMethod.GET)
	public String displayCart(String user_id,ModelMap model) throws Exception {
		List<KdhFoodCartDto> list = cartService.AllCart(user_id);
		int food_total_money = cartService.FoodTotalMoney();
		model.addAttribute("list", list);
		model.addAttribute("food_total_money", food_total_money);
		return "user/kdh/kdh_food/kdh_cart";
	}
	
	// 장바구니 삭제 
	@RequestMapping(value = "/delete", method = RequestMethod.GET)
	public String deleteCart(int food_cart_num, HttpSession session) throws Exception {
		String user_id = (String) session.getAttribute("user_id");
		cartService.deleteCart(food_cart_num);
		return "redirect:/cart/displayCart?user_id=" + user_id;
	}
	
	// 장바구니 수정 (ajax -> url -> user_id,food_num)
	@ResponseBody
	@RequestMapping(value= "/update", method = RequestMethod.GET)
	public String updateCart(int food_cart_num, int food_cart_count,int buy_food_price,HttpSession session) throws Exception {
		String user_id = (String) session.getAttribute("user_id");
		cartService.updateCart(food_cart_num, food_cart_count, buy_food_price);
		return "success";
	}
}
