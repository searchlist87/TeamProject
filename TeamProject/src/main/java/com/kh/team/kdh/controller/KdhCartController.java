package com.kh.team.kdh.controller;


import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.swing.plaf.synth.SynthSeparatorUI;

import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.team.domain.KdhBasicCartDto;
import com.kh.team.domain.KdhFoodCartDto;
import com.kh.team.domain.KdhFoodVo;
import com.kh.team.domain.KdhPointCodeVo;
import com.kh.team.domain.KdhUserVo;
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
	public String displayCart(String user_id, ModelMap model, HttpSession session) throws Exception {
		int cartCount = cartService.selectCartCount(user_id);
		session.setAttribute("cartCount", cartCount);
		
		List<KdhFoodCartDto> list = cartService.AllCart(user_id);
		int food_total_money = cartService.FoodTotalMoney(user_id);
		KdhUserVo userInfo = foodService.selectUserInfo(user_id);
		int user_point = userInfo.getUser_point();
		int totalPoint = 0;
		if (user_point != 0) {
			totalPoint = pointService.selectPointByUserId(user_id);
			model.addAttribute("totalPoint", totalPoint);
		} else {
			model.addAttribute("totalPoint", totalPoint);
		}
		model.addAttribute("list", list);
		model.addAttribute("totalPoint", totalPoint);
		model.addAttribute("food_total_money", food_total_money);
		model.addAttribute("user_id", user_id);
		return "user/kdh/kdh_food/kdh_cart";
	}
	
	
	// 장바구니 삭제(GET)
	@RequestMapping(value = "/delete", method = RequestMethod.GET)
	public String deleteGET(int food_cart_num, HttpSession session) throws Exception {
		String user_id = (String) session.getAttribute("user_id");
		cartService.deleteCart(food_cart_num);
		int cartCount = cartService.selectCartCount(user_id);
		session.setAttribute("cartCount", cartCount);
		if (cartCount == 0) {
			return "user/kdh/kdh_food/kdh_buy_none";
		}
		return "redirect:/kdh/cart/displayCart?user_id=" + user_id;
	}
	
	
	// 장바구니 삭제(POST)
	@ResponseBody
	@RequestMapping(value = "/delete", method = RequestMethod.POST)
	public int deletePOST(HttpSession session, @RequestParam(value = "selectCheck[]") List<String> checkArr, Model model) throws Exception {
		System.out.println("checkArr:" + checkArr);
		String user_id = (String) session.getAttribute("user_id");
		model.addAttribute("user_id", user_id);
		int food_cart_num = 0;
		int result = 0;
		if(user_id != null || user_id != "") {
			for(String i : checkArr) {
				food_cart_num = Integer.parseInt(i);
				System.out.println("food_cart_num:" + food_cart_num);
				cartService.deleteCart(food_cart_num);
				int cartCount = cartService.selectCartCount(user_id);
				session.setAttribute("cartCount", cartCount);
			}
			result = 1;
		int cartCount = cartService.selectCartCount(user_id);
		session.setAttribute("cartCount", cartCount);
			if(cartCount == 0) {
				result = 3;
			}
		}
		return result;
	}
	
	// 장바구니 수정 (ajax -> url -> user_id,food_num)
	@ResponseBody
	@RequestMapping(value= "/update", method = RequestMethod.GET)
	public String updateCart(int food_cart_num, int food_cart_count, int buy_food_price) throws Exception {
		cartService.updateCart(food_cart_num, food_cart_count, buy_food_price);
		return "success";
	}
	
	// 장바구니 결제하기
	@RequestMapping(value = "/buyCart", method = RequestMethod.POST)
	public String buy(HttpSession session, String used_Point1, String food_buy_price1, int[] food_frm_num) throws Exception {
		String user_id = (String) session.getAttribute("user_id");
		
		int used_Point = Integer.parseInt(used_Point1);
		int food_buy_price = Integer.parseInt(food_buy_price1);

		KdhPointCodeVo codeVo = pointService.selectFoodPercent();
		int point_percent = codeVo.getPoint_percent();

		pointService.insertPointInData(user_id, food_buy_price, point_percent);
		pointService.updateTotalUserPoint(food_buy_price, point_percent, user_id);
		int totalPoint = pointService.selectTotalPoint(user_id);
		
		if (totalPoint != 0 && used_Point != 0) {
			pointService.updateUserPoint(used_Point, user_id);
			pointService.insertUsedPointInfo(user_id, used_Point);
		}
		
		List<KdhBasicCartDto> cartDto = null;
		for (int i = 0 ; i < food_frm_num.length; i++) {
			cartDto = cartService.selectCartListByUserId(user_id, food_frm_num[i]);
			
			for (KdhBasicCartDto data : cartDto) {
			kdhFoodBuyDto foodBuyDto = new kdhFoodBuyDto();
			// food_num, user_id, food_buy_total_price, food_buy_count
			int food_buy_total_price = data.getBuy_food_price();
			int food_cart_count = data.getFood_cart_count();
			int food_num = data.getFood_num();
			
			foodBuyDto.setFood_num(food_num);
			foodBuyDto.setUser_id(user_id);
			foodBuyDto.setFood_buy_count(food_cart_count);
			foodBuyDto.setFood_buy_total_price(food_buy_total_price);
			foodService.insertFoodBuy(foodBuyDto);
			
			// foodBuyListDto 설정
			// food_num, user_id, food_buy_total_price, food_buy_count
			kdhFoodBuyListDto foodBuyListDto = new kdhFoodBuyListDto();
			foodBuyListDto.setFood_num(food_num);
			foodBuyListDto.setUser_id(user_id);
			foodBuyListDto.setFood_buy_count(food_cart_count);
			foodBuyListDto.setFood_buy_total_price(food_buy_total_price);
			foodService.insertFoodBuyList(foodBuyListDto);
		
			}
		}
			cartService.deleteFoodCartAll(user_id);
			session.setAttribute("cartCount", 0);
			return "redirect:/kdh/food/buyView";
		}
}
