package com.kh.team.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.team.domain.SghAreaVo;
import com.kh.team.domain.SghMovieNameVo;
import com.kh.team.domain.SghTheaterVo;
import com.kh.team.service.SghAreaService;
import com.kh.team.service.SghMovieScheduleService;
import com.kh.team.service.SghTheaterService;

@Controller
@RequestMapping("/sgh/book")
public class SghBookController {
	
	@Inject
	private SghTheaterService sghTheaterService;
	@Inject
	private SghMovieScheduleService sghMovieScheduleService;
	@Inject
	private SghAreaService sghAreaService;
	
	@RequestMapping(value="/bookingView", method=RequestMethod.GET)
	public String testBookingView(Model model) throws Exception {
		List<SghTheaterVo> theaterList = sghTheaterService.getTheaterList();
		List<SghAreaVo> areaList = sghAreaService.getAreaList();
		System.out.println("theaterList :" + theaterList);
		System.out.println("areaList :" + areaList);
		model.addAttribute("theaterList", theaterList);
		model.addAttribute("areaList", areaList);
		return "user/sgh/sgh_book/sgh_booking_view";
	}
	
	@ResponseBody
	@RequestMapping(value="/getMovieName", method=RequestMethod.GET)
	public List<SghMovieNameVo> testMovieName(String theater_code) throws Exception {
		System.out.println("theater_code :" + theater_code);
		return sghMovieScheduleService.getMovieName(theater_code);
	}
	
	@RequestMapping(value="/testAdmin", method=RequestMethod.GET)
	public String test() throws Exception {
		System.out.println("hi :");
		return "user/sgh/sgh_book/sgh_test_admin";
	}
}
