package com.kh.team.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
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
		List<KdhFoodVo> list = foodService.listFood();
		List<KdhFoodVo> listLatestFood = foodService.listLatestFood();
		model.addAttribute("list", list);
		model.addAttribute("listLatestFood", listLatestFood);
//		model.addAttribute("page", page);
		return "user/kdh/kdh_food/kdh_food-grid";
	} 
	
	// 상품 등록(GET)
	@RequestMapping(value = "/insertFood", method = RequestMethod.GET)
	public String insertFoodGet() throws Exception {
		return "user/kdh/kdh_food/kdh_insertFood";
	}
	
	// 상품 등록(POST)
	@RequestMapping(value = "/insertFood", method = RequestMethod.POST)
	public String insertFoodPost() throws Exception {
		return "redirect:/kdh/food/foodView";
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
	public String listFoodCode100(ModelMap model) throws Exception {
		List<KdhFoodVo> list = foodService.listFoodCode100();
		List<KdhFoodVo> listLatestFood = foodService.listLatestFood();
		model.addAttribute("list", list);
		model.addAttribute("listLatestFood", listLatestFood);
		return "user/kdh/kdh_food/kdh_snack";
	}
	
	// 상품 선택하기(200 음료)
	@RequestMapping(value = "/drink", method = RequestMethod.GET)
	public String listFoodCode200(Model model) throws Exception {
		List<KdhFoodVo> list = foodService.listFoodCode200();
		List<KdhFoodVo> listLatestFood = foodService.listLatestFood();
		model.addAttribute("list", list);
		model.addAttribute("listLatestFood", listLatestFood);
		return "user/kdh/kdh_food/kdh_drink";
	}
	
	// 상품 선택하기(300 패키지)
	@RequestMapping(value = "/package", method = RequestMethod.GET)
	public String listFoodCode300(Model model) throws Exception {
		List<KdhFoodVo> list = foodService.listFoodCode300();
		List<KdhFoodVo> listLatestFood = foodService.listLatestFood();
		model.addAttribute("list", list);
		model.addAttribute("listLatestFood", listLatestFood);
		return "user/kdh/kdh_food/kdh_package";
	}
	
//	// 상품 페이징
//	@RequestMapping(value = "/listPage", method = RequestMethod.GET)
//	@ResponseBody
//	public void listPage(KdhPagingDto pagingDto, Model model) throws Exception {
//		
//		
//	}
}
