package com.kh.team.kdh.controller;


import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.team.domain.KdhBasicCartDto;
import com.kh.team.domain.KdhFoodCartDto;
import com.kh.team.domain.KdhFoodVo;
import com.kh.team.domain.kdhFoodBuyDto;
import com.kh.team.domain.kdhFoodBuyListDto;
import com.kh.team.kdh.service.KdhFoodCartService;
import com.kh.team.kdh.service.KdhFoodService;
import com.kh.team.kdh.service.KdhPointService;

@RequestMapping("/kdh/cart")
@Controller
public class KdhCartController {
	
	@Inject
	KdhFoodCartService cartService;
	@Inject
	KdhFoodService foodService;
	@Inject
	KdhPointService pointService;
	
	// 카트 메인 페이지
	@RequestMapping(value = "/displayCart", method = RequestMethod.GET)
	public String displayCart(String user_id, ModelMap model) throws Exception {
		List<KdhFoodCartDto> list = cartService.AllCart(user_id);
		int food_total_money = cartService.FoodTotalMoney(user_id);
		model.addAttribute("list", list);
		model.addAttribute("food_total_money", food_total_money);
		return "user/kdh/kdh_food/kdh_cart";
	}
	
	
	// 장바구니 삭제 
	@RequestMapping(value = "/delete", method = RequestMethod.GET)
	public String deleteCart(int food_cart_num, HttpSession session) throws Exception {
		String user_id = (String) session.getAttribute("user_id");
		cartService.deleteCart(food_cart_num);
		return "redirect:/kdh/cart/displayCart?user_id=" + user_id;
	}
	
	// 장바구니 수정 (ajax -> url -> user_id,food_num)
	@ResponseBody
	@RequestMapping(value= "/update", method = RequestMethod.GET)
	public String updateCart(int food_cart_num, int food_cart_count,int buy_food_price,HttpSession session) throws Exception {
		String user_id = (String) session.getAttribute("user_id");
		cartService.updateCart(food_cart_num, food_cart_count, buy_food_price);
		return "success";
	}
	
	// 장바구니 결제하기
	@RequestMapping(value = "/buyCart", method = RequestMethod.GET)
	@Transactional
	public String buy(HttpSession session,ModelMap model) throws Exception {
		String user_id = (String) session.getAttribute("user_id");
		List<KdhBasicCartDto> cartDto = cartService.selectCartListByUserId(user_id);
		int total_price = cartService.FoodTotalMoney(user_id);
		model.addAttribute("total_price", total_price);
		
		// foodBuyDto 설정
		for (KdhBasicCartDto data : cartDto ) {
			System.out.println("data:" + data);
			kdhFoodBuyDto foodBuyDto = new kdhFoodBuyDto();
			// food_num, user_id, food_buy_total_price, food_buy_count
			int food_buy_total_price = data.getBuy_food_price();
			int food_buy_count = data.getFood_cart_count();
			int food_num = data.getFood_num();
			
			foodBuyDto.setFood_num(food_num);
			foodBuyDto.setUser_id(user_id);
			foodBuyDto.setFood_buy_count(food_buy_count);
			foodBuyDto.setFood_buy_total_price(food_buy_total_price);
			foodService.insertFoodBuy(foodBuyDto);
			
			// foodBuyListDto 설정
			// food_num, user_id, food_buy_total_price, food_buy_count
			kdhFoodBuyListDto foodBuyListDto = new kdhFoodBuyListDto();
			foodBuyListDto.setFood_num(food_num);
			foodBuyListDto.setUser_id(user_id);
			foodBuyListDto.setFood_buy_total_price(food_buy_total_price);
			foodBuyListDto.setFood_buy_count(food_buy_count);
			foodService.insertFoodBuyList(foodBuyListDto);
		}
			return "user/kdh/kdh_food/kdh_buy_view";
		}
}
