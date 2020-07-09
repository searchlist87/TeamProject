package com.kh.team.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/kdh/food")
public class KdhController {

	@RequestMapping(value = "/foodView", method = RequestMethod.GET)
	public String foodView() throws Exception {
		return "user/kdh/kdh_food/kdh_food-grid";
	} 
	
	// 캬라멜 팝콘
	@RequestMapping(value = "/honeyPopCon", method = RequestMethod.GET)
	public String honeyPopCon() throws Exception {
		return "user/kdh/kdh_food/kdh_honeyPopCon";
	}
	
	// 갈릭 팝콘
	@RequestMapping(value = "/garicPopCon", method = RequestMethod.GET)
	public String garicPopCon() throws Exception {
		return "user/kdh/kdh_food/kdh_garicPopCon";
	}
	
	// 베이직 팝콘
	@RequestMapping(value = "/basicPopCon", method = RequestMethod.GET)
	public String basicPopCon() throws Exception {
		return "user/kdh/kdh_food/kdh_basicPopCon";
	}
	
	// 사이다
	@RequestMapping(value = "/saida", method = RequestMethod.GET)
	public String saida() throws Exception {
		return "user/kdh/kdh_food/kdh_saida";
	}
	
	// 복숭아 아이스티
	@RequestMapping(value = "/peachIcedtea", method = RequestMethod.GET)
	public String peachIcedtea() throws Exception {
		return "user/kdh/kdh_food/kdh_peachIcedtea";
	}
	
	// 레몬 아이스티
	@RequestMapping(value = "/lemonIcedtea", method = RequestMethod.GET)
	public String lemonIcedtea() throws Exception {
		return "user/kdh/kdh_food/kdh_lemonIcedtea";
	}
	
	// 핫도그
	@RequestMapping(value = "/hotDog", method = RequestMethod.GET)
	public String hotDog() throws Exception {
		return "user/kdh/kdh_food/kdh_hotDog";
	}
	
	// 나초
	@RequestMapping(value = "/nacho", method = RequestMethod.GET)
	public String nacho() throws Exception {
		return "user/kdh/kdh_food/kdh_nacho";
	}
}
