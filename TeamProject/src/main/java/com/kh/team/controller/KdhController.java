package com.kh.team.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.kh.team.domain.KdhFoodVo;
import com.kh.team.service.KdhFoodService;

@Controller
@RequestMapping("/kdh/food")
public class KdhController {

	@Inject
	KdhFoodService foodService;
	
	// 스토어 메인
	@RequestMapping(value = "/foodView", method = RequestMethod.GET)
	public String foodView(Model model) throws Exception {
		List<KdhFoodVo> list = foodService.listFood();
		model.addAttribute("list", list);
//		System.out.println("list:" + list);
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
		System.out.println("foodVo:" + foodVo);
		return "user/kdh/kdh_food/kdh_Innerfood";
	}

	// 상품 이너 페이지
	@RequestMapping(value = "/Innerfood", method = RequestMethod.POST)
	public String InnerfoodPost() throws Exception {
		return "user/kdh/kdh_food/kdh_Innerfood";
	}

	// 상품 선택하기(100 스낵)
	@RequestMapping(value = "/snack", method = RequestMethod.GET)
	public String listFoodCode100(Model model) throws Exception {
		List<KdhFoodVo> list = foodService.listFoodCode100();
		model.addAttribute("list", list);
		return "user/kdh/kdh_food/kdh_snack";
	}
	
	// 상품 선택하기(200 음료)
	@RequestMapping(value = "/drink", method = RequestMethod.GET)
	public String listFoodCode200(Model model) throws Exception {
		List<KdhFoodVo> list = foodService.listFoodCode200();
		model.addAttribute("list", list);
		return "user/kdh/kdh_food/kdh_drink";
	}
	
	// 상품 선택하기(300 패키지)
	@RequestMapping(value = "/package", method = RequestMethod.GET)
	public String listFoodCode300(Model model) throws Exception {
		List<KdhFoodVo> list = foodService.listFoodCode300();
		model.addAttribute("list", list);
		return "user/kdh/kdh_food/kdh_package";
	}
}
