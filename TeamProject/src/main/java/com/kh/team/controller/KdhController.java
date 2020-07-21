package com.kh.team.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.team.domain.KdhBuyFoodInfo;
import com.kh.team.domain.KdhFoodCartDto;
import com.kh.team.domain.KdhFoodVo;
import com.kh.team.domain.KdhPagingDto;
import com.kh.team.service.KdhFoodCartService;
import com.kh.team.service.KdhFoodService;

@Controller
@RequestMapping("/kdh/food")
public class KdhController {

	@Inject
	KdhFoodService foodService;
	@Inject
	KdhFoodCartService cartService;
	
	// 스토어 메인
	@RequestMapping(value = "/foodView", method = RequestMethod.GET)
	public String foodView(ModelMap model, KdhPagingDto pagingDto) throws Exception {
		List<KdhFoodVo> listLatestFood = foodService.listLatestFood();
		List<KdhFoodVo> listPageFoodlist = foodService.listPage(pagingDto);
		int foodCount = foodService.foodCount();
		pagingDto.setPageInfo(foodCount);
		model.addAttribute("pagingDto", pagingDto);
		model.addAttribute("listLatestFood", listLatestFood);
		model.addAttribute("listPageFoodlist", listPageFoodlist);
		return "user/kdh/kdh_food/kdh_food-grid";
	} 
	
	// 상품 이너 페이지(GET)
	@RequestMapping(value = "/innerfood", method = RequestMethod.GET)
	public String InnerfoodGet(int food_num, ModelMap model, HttpSession session) throws Exception {
		KdhFoodVo foodVo = foodService.selectFoodbyNum(food_num);
		String user_id = (String) session.getAttribute("user_id");
//		String findCartResult= cartService.overlapCart(user_id, food_num);
//		model.addAttribute("findCartResult", findCartResult);
		model.addAttribute("foodVo", foodVo);
		model.addAttribute("user_id", user_id);
		return "user/kdh/kdh_food/kdh_Innerfood";
	}

	// 상품 선택하기(100 스낵)
	@RequestMapping(value = "/snack", method = RequestMethod.GET)
	public String listFoodCode100(ModelMap model, KdhPagingDto pagingDto) throws Exception {
		List<KdhFoodVo> list = foodService.listFoodCode100(pagingDto);
		List<KdhFoodVo> listLatestFood = foodService.listLatestFood();
		int foodCount = foodService.CountFoodCode100();
		pagingDto.setPageInfo(foodCount);
		model.addAttribute("pagingDto", pagingDto);
		model.addAttribute("list", list);
		model.addAttribute("listLatestFood", listLatestFood);
		return "user/kdh/kdh_food/kdh_snack";
	}
	
	// 상품 선택하기(200 음료)
	@RequestMapping(value = "/drink", method = RequestMethod.GET)
	public String listFoodCode200(ModelMap model, KdhPagingDto pagingDto) throws Exception {
		List<KdhFoodVo> list = foodService.listFoodCode200(pagingDto);
		List<KdhFoodVo> listLatestFood = foodService.listLatestFood();
		int foodCount = foodService.CountFoodCode200();
		pagingDto.setPageInfo(foodCount);
		model.addAttribute("pagingDto", pagingDto);
		model.addAttribute("list", list);
		model.addAttribute("listLatestFood", listLatestFood);
		return "user/kdh/kdh_food/kdh_drink";
	}
	
	// 상품 선택하기(300 패키지)
	@RequestMapping(value = "/package", method = RequestMethod.GET)
	public String listFoodCode300(ModelMap model, KdhPagingDto pagingDto) throws Exception {
		List<KdhFoodVo> list = foodService.listFoodCode300(pagingDto);
		List<KdhFoodVo> listLatestFood = foodService.listLatestFood();
		int foodCount = foodService.CountFoodCode300();
		pagingDto.setPageInfo(foodCount);
		model.addAttribute("pagingDto", pagingDto);
		model.addAttribute("list", list);
		model.addAttribute("listLatestFood", listLatestFood);
		return "user/kdh/kdh_food/kdh_package";
	}
	
	// 구매하기
	@RequestMapping(value = "/buy", method = RequestMethod.GET)
	public String buy(ModelMap model,int buy_food_num, int buy_food_buy_price, int buy_food_buy_count, String buy_user_id) throws Exception {

		KdhFoodVo foodVo = foodService.selectFoodbyNum(buy_food_num);
		String food_image = foodVo.getFood_image();
		String food_name = foodVo.getFood_name();
		int food_price = foodVo.getFood_price();
		int food_count = foodVo.getFood_count();
		
		model.addAttribute("food_count", food_count);
		model.addAttribute("food_image", food_image);
		model.addAttribute("food_name", food_name);
		model.addAttribute("food_price", food_price);
		model.addAttribute("buy_food_buy_price", buy_food_buy_price);
		model.addAttribute("buy_food_buy_count", buy_food_buy_count);

		return "user/kdh/kdh_food/kdh_buy";
	}

}
