package com.kh.team.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.team.domain.KdhBuyFoodInfo;
import com.kh.team.domain.KdhFoodCartDto;
import com.kh.team.domain.KdhFoodVo;
import com.kh.team.domain.KdhPagingDto;
import com.kh.team.domain.KdhPointCodeVo;
import com.kh.team.domain.KdhPointVo;
import com.kh.team.domain.KdhUserVo;
import com.kh.team.domain.kdhFoodBuyDto;
import com.kh.team.domain.kdhFoodBuyListDto;
import com.kh.team.service.KdhFoodCartService;
import com.kh.team.service.KdhFoodService;
import com.kh.team.service.KdhPointService;

@Controller
@RequestMapping("/kdh/food")
public class KdhController {

	@Inject
	KdhFoodService foodService;
	@Inject
	KdhFoodCartService cartService;
	@Inject
	KdhPointService pointService;
	
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
		int findCartResult= cartService.overlapCart(user_id, food_num);
		model.addAttribute("findCartResult", findCartResult);
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
	
	// 카트 ajax요청
	@ResponseBody
	@RequestMapping(value = "/cartAjax", method = RequestMethod.GET)
	public String cartAjax(ModelMap model,String user_id,int food_num,int food_buy_price,int food_buy_count) throws Exception {
		int findCartResult = cartService.overlapCart(user_id, food_num);
		// 중복 상품이 없으면
		if (findCartResult==0) {
			KdhFoodCartDto cartDto = new KdhFoodCartDto();
			cartDto.setBuy_food_price(food_buy_price);
			cartDto.setFood_cart_count(food_buy_count);
			cartDto.setFood_num(food_num);
			cartDto.setUser_id(user_id);
			cartService.insertCart(cartDto);
			return "success";
		} else if (findCartResult==1) {
			return "false";
		}

		return "success";
	}
		
		
	// 구매하기
	@RequestMapping(value = "/buy", method = RequestMethod.GET)
	@Transactional
	public String buy(ModelMap model,int buy_food_num, int buy_food_buy_price, int buy_food_buy_count, String buy_user_id) throws Exception {
		List<KdhPointVo> pointList = pointService.selectPointById(buy_user_id);
		int totalPoint = pointService.selectTotalPoint(buy_user_id);
		KdhUserVo userInfo = foodService.selectUserInfo(buy_user_id);
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
		model.addAttribute("pointList", pointList);
		model.addAttribute("userInfo", userInfo);
		model.addAttribute("totalPoint", totalPoint);
		// foodBuyDto 설정
		kdhFoodBuyDto foodBuyDto = new kdhFoodBuyDto();
		// food_num, user_id, food_buy_total_price, food_buy_count
		foodBuyDto.setFood_num(buy_food_num);
		foodBuyDto.setUser_id(buy_user_id);
		foodBuyDto.setFood_buy_total_price(buy_food_buy_price);
		foodBuyDto.setFood_buy_count(buy_food_buy_count);
		foodService.insertFoodBuy(foodBuyDto);
		
		// foodBuyListDto 설정
		kdhFoodBuyListDto foodBuyListDto = new kdhFoodBuyListDto();
		foodBuyListDto.setFood_num(buy_food_num);
		foodBuyListDto.setUser_id(buy_user_id);
		foodBuyListDto.setFood_buy_total_price(buy_food_buy_price);
		foodBuyListDto.setFood_buy_count(buy_food_buy_count);
		foodService.insertFoodBuyList(foodBuyListDto);
		
		return "user/kdh/kdh_food/kdh_buy";
	}

	// 결제완료
	@RequestMapping(value = "/buyView", method = RequestMethod.GET)
	public String buyView(HttpSession session, int user_point, int food_buy_price) throws Exception {
		String user_id = (String) session.getAttribute("user_id");
		List<KdhPointVo> pointVo = pointService.selectPointById(user_id);
		KdhPointCodeVo codeVo = pointService.selectFoodPercent();
		int point_percent = codeVo.getPoint_percent();
		
		pointService.insertPointInData(user_id, food_buy_price, point_percent);
		int totalPoint = pointService.selectTotalPoint(user_id);
		pointService.updateTotalUserPoint(totalPoint, user_id);
		
		pointService.updateTotalUserPoint(user_point, user_id);
		
		return "user/kdh/kdh_food/kdh_buy_view";
	}
	
	@RequestMapping(value = "/buyFoodNone", method = RequestMethod.GET)
	public String buyFoodNone(HttpSession session) throws Exception {
		String user_id = (String) session.getAttribute("user_id");
//		pointService.insertPointInData(user_id);
		
		return "user/kdh/kdh_food/kdh_buy_none";
	}
}
