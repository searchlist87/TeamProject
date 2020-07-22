package com.kh.team.sgh.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.team.domain.SghAreaVo;
import com.kh.team.domain.SghBookingVo;
import com.kh.team.domain.SghMovieNameVo;
import com.kh.team.domain.SghTheaterVo;
import com.kh.team.sgh.service.SghAreaService;
import com.kh.team.sgh.service.SghBookingService;
import com.kh.team.sgh.service.SghMovieScheduleService;
import com.kh.team.sgh.service.SghTheaterService;

@Controller
@RequestMapping("/sgh/book")
public class SghBookController {
	
	@Inject
	private SghTheaterService sghTheaterService;
	@Inject
	private SghMovieScheduleService sghMovieScheduleService;
	@Inject
	private SghAreaService sghAreaService;
	@Inject
	private SghBookingService sghBookingService;
	
	@RequestMapping(value="/bookingView", method=RequestMethod.GET)
	public String bookingView(Model model) throws Exception {
		List<SghTheaterVo> theaterList = sghTheaterService.getTheaterList();
		List<SghAreaVo> areaList = sghAreaService.getAreaList();
		model.addAttribute("theaterList", theaterList);
		model.addAttribute("areaList", areaList);
		return "user/sgh/sgh_book/sgh_booking_view";
	}
	
	@ResponseBody
	@RequestMapping(value="/getMovieName", method=RequestMethod.GET)
	public List<SghMovieNameVo> movieName(String theater_code) throws Exception {
		return sghMovieScheduleService.getMovieName(theater_code);
	}
	
	@RequestMapping(value="/testAdmin", method=RequestMethod.GET)
	public String test() throws Exception {
		return "user/sgh/sgh_book/sgh_test_admin";
	}
	
	// 영화 일정
	@ResponseBody
	@RequestMapping(value="/movieSchedule", method=RequestMethod.GET)
	public List<SghBookingVo> getDayMovieList(String start_date, String movie_code) throws Exception {
		
		List<SghBookingVo> booking_list = sghBookingService.getChoiceMovieList(start_date, movie_code);
		System.out.println("booking_list :" + booking_list);
		return booking_list;
	}
}
