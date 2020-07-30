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
import com.kh.team.kdh.service.KdhFoodCartService;
import com.kh.team.kdh.service.KdhFoodService;


@Controller
@RequestMapping("/kdh/mypage")
public class KdhMypageController {

	@Inject
	KdhFoodService foodService;
	
	@RequestMapping(value="/buyFoodList", method=RequestMethod.GET)
	public String movieBuyForm(HttpSession session, Model model) throws Exception {
		String user_id = (String)session.getAttribute("user_id");
		List<KdhMypageBuyFoodListDto> buyFoodList = foodService.selectMyPageBuyFoodList(user_id);
		System.out.println("buyFoodList: " + buyFoodList);
		model.addAttribute("buyFoodList", buyFoodList);
		return "user/jmh/jmh_mypage/jmh_buyFoodList";
	}
	
}
