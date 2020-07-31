package com.kh.team.kdh.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.kh.team.domain.KdhAdminFoodBuyListDto;
import com.kh.team.domain.KdhFoodVo;
import com.kh.team.domain.KdhMypageBuyFoodListDto;
import com.kh.team.domain.KdhPagingDto;
import com.kh.team.kdh.service.KdhFoodCartService;
import com.kh.team.kdh.service.KdhFoodService;


@Controller
@RequestMapping("/kdh/mypage")
public class KdhMypageController {

	@Inject
	KdhFoodService foodService;
	
	// 마이 페이지 푸드 구매내역 조회
	@RequestMapping(value="/buyFoodList", method=RequestMethod.GET)
	public String movieBuyForm(HttpSession session, Model model, KdhPagingDto pagingDto) throws Exception {
		String user_id = (String)session.getAttribute("user_id");
		// 페이징 작업
		int perPage = 10;
		pagingDto.setPerPage(perPage);
		int foodBuyListCount = foodService.selectMyPageFoodBuyListCount(user_id);
		pagingDto.setPageInfo(foodBuyListCount);
		List<KdhMypageBuyFoodListDto> buyFoodList = foodService.selectMyPageBuyFoodList(user_id);
		
		model.addAttribute("buyFoodList", buyFoodList);
		model.addAttribute("pagingDto", pagingDto);
		return "user/jmh/jmh_mypage/jmh_buyFoodList";

	}
	
}
