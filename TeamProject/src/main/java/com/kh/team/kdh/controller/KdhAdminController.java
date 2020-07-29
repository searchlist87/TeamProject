package com.kh.team.kdh.controller;

import java.io.File;
import java.io.FileInputStream;
import java.util.List;

import javax.inject.Inject;

import org.apache.commons.io.IOUtils;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Repository;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.team.domain.KdhFoodVo;
import com.kh.team.domain.KdhPagingDto;
import com.kh.team.kdh.service.KdhFoodCartService;
import com.kh.team.kdh.service.KdhFoodService;

@RequestMapping("/kdh/admin")
@Controller
public class KdhAdminController {

	@Inject
	private KdhFoodService foodService;
	@Inject
	private KdhFoodCartService cartService;
	
	// 임시 폼
	@RequestMapping(value = "/admin_food_form", method = RequestMethod.GET)
	public String admin_food_form() throws Exception {
		return "user/kdh/kdh_admin/kdh_admin_food_form";
	}
	
	// 푸드 상품관리_상품조회
	@RequestMapping(value = "/admin_food_list", method = RequestMethod.GET)
	public String admin_food_list(ModelMap model, KdhPagingDto pagingDto) throws Exception {
		List<KdhFoodVo> foodlist = foodService.selectListFood();
		List<KdhFoodVo> listPageFoodlist = foodService.listPage(pagingDto);
		int foodCount = foodService.selectFoodCount();
		pagingDto.setPageInfo(foodCount);
		model.addAttribute("foodlist", foodlist);
		model.addAttribute("listPageFoodlist", listPageFoodlist);
		model.addAttribute("pagingDto", pagingDto);
		return "user/kdh/kdh_admin/kdh_admin_food_list";
	}
	
	// 푸드 상품관리_상품등록_이너페이지
	@RequestMapping(value = "/admin_food_selectByFood", method = RequestMethod.GET)
	public String kdh_admin_food_selectByFood(int food_num, Model model) throws Exception {
		KdhFoodVo foodVo = foodService.selectFoodbyNum(food_num);
		model.addAttribute("foodVo", foodVo);
		return "user/kdh/kdh_admin/kdh_admin_food_selectByFood";
	}
		
	// 푸드 상품관리_상품등록_이너페이지_수정(GET)
	@RequestMapping(value = "/admin_food_modify", method = RequestMethod.GET)
	public String admin_food_modify(int food_num, Model model) throws Exception {
		KdhFoodVo foodVo = foodService.selectFoodbyNum(food_num);
		model.addAttribute("foodVo", foodVo);
		return "user/kdh/kdh_admin/kdh_admin_food_modify";
	}
	
	// 푸드 상품관리_상품등록_이너페이지_수정(POST)
	@RequestMapping(value = "/admin_food_modify", method = RequestMethod.POST)
	public String admin_food_modify_do(KdhFoodVo foodVo, int food_num, ModelMap model) throws Exception {
		foodVo.setFood_num(food_num);
		foodService.updateFoodbyNum(foodVo);
		List<KdhFoodVo> foodlist = foodService.selectListFood();
		model.addAttribute("foodlist", foodlist);
		return "redirect:/kdh/admin/admin_food_list";
	}
	
	// 푸드 상품관리_상품_삭제
	@RequestMapping(value = "/admin_food_delete", method = RequestMethod.GET)
	public String admin_food_delete(int food_num, ModelMap model) throws Exception {
		foodService.deleteFoodBuy(food_num);
		cartService.deleteFoodCart(food_num);
		foodService.deleteFoodByNum(food_num);
//		List<KdhFoodVo> foodlist = foodService.selectListFood();
//		model.addAttribute("foodlist", foodlist);
		return "redirect:/kdh/admin/admin_food_list";
	}

	// 푸드 상품관리_상품등록_폼
	@RequestMapping(value = "/admin_food_register", method = RequestMethod.GET)
	public String admin_food_register() throws Exception {
		return "user/kdh/kdh_admin/kdh_admin_food_register";
	}
	
	// 푸드 상품관리_상품등록
	@RequestMapping(value = "/admin_food_register", method = RequestMethod.POST)
	public String admin_food_registerPOST(KdhFoodVo foodVo) throws Exception {
		foodService.insertFood(foodVo);
		return "redirect:/kdh/admin/admin_food_list";
	}
	
	// 푸드 푸드내역 조회
	@RequestMapping(value = "/admin_food_buy_list", method = RequestMethod.GET)
	public String admin_food_buy_list() throws Exception {
		return "user/kdh/kdh_admin/kdh_admin_food_buy_list";
	}
	
}
