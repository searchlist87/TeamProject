package com.kh.team.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.team.domain.SghTheaterVo;
import com.kh.team.service.SghTheaterService;

@Controller
@RequestMapping("/sgh/book")
public class SghBookController {
	
	@Inject
	private SghTheaterService sghTheaterService;
	
	@RequestMapping(value="/bookingView", method=RequestMethod.GET)
	public String testBookingView(Model model) throws Exception {
		List<SghTheaterVo> list = sghTheaterService.getAreaList();
		int listSize = list.size();
		model.addAttribute("list", list);
		model.addAttribute("listSize", listSize);
		return "user/sgh/sgh_book/sgh_booking_view";
	}
	
	@ResponseBody
	@RequestMapping(value="/areaMovie", method=RequestMethod.GET)
	public String testLocation(@RequestBody String hi) throws Exception {
		System.out.println("hi :" + hi);
		return null;
	}
}
