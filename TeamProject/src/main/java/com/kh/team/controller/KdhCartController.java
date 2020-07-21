package com.kh.team.controller;


import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

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
	public String displayCart(HttpServletRequest request, ModelMap model) throws Exception {
		int food_num = Integer.parseInt(request.getParameter("food_num"));
		int food_buy_price = Integer.parseInt(request.getParameter("food_buy_price"));
		int food_buy_count = Integer.parseInt(request.getParameter("food_buy_count"));
		String user_id = request.getParameter("user_id");
		List<KdhFoodCartDto> list = cartService.AllCart(user_id);
		model.addAttribute("list", list);
		String findCartResult = cartService.overlapCart(user_id, food_num);

//		if (!(findCartResult.equals(true))) {
			KdhFoodCartDto cartDto = new KdhFoodCartDto();
			cartDto.setBuy_food_price(food_buy_price);
			cartDto.setFood_cart_count(food_buy_count);
			cartDto.setFood_num(food_num);
			cartDto.setUser_id(user_id);
			cartService.insertCart(cartDto);
//		}
				
		model.addAttribute("findCartResult", findCartResult);
		return "user/kdh/kdh_food/kdh_cart";
	}
	
	// 장바구니 삭제
	@RequestMapping(value = "/delete", method = RequestMethod.GET)
	public void deleteCart(int food_cart_num) throws Exception {
		int food_cart_num2 = cartService.selectFoodnumByCartnum(food_cart_num);
		cartService.deleteCart(food_cart_num2);
//		return "redirect:/cart/displayCart";
		// ?food_num=242&food_buy_price=3000&food_buy_count=1&user_id=user01
	}
}
