package com.kh.team.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.team.domain.KdhFoodVo;
import com.kh.team.domain.KdhPagingDto;
import com.kh.team.service.KdhFoodService;

@Controller
@RequestMapping("/kdh/food")
public class KdhController {

	@Inject
	KdhFoodService foodService;
	
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
	public String InnerfoodGet(int food_num, Model model) throws Exception {
		KdhFoodVo foodVo = foodService.selectFoodbyNum(food_num);
		model.addAttribute("foodVo", foodVo);
		return "user/kdh/kdh_food/kdh_Innerfood";
	}

	// 상품 이너 페이지
	@RequestMapping(value = "/Innerfood", method = RequestMethod.POST)
	public String InnerfoodPost() throws Exception {
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
	
	@RequestMapping(value = "/cart", method = RequestMethod.GET)
	public String cart(int food_num, int food_price, int food_buy_count) throws Exception {
		return "user/kdh/kdh_food/kdh_cart";
	}
}
