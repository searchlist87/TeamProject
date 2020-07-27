package com.kh.team.sgh.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.core.JsonFactory;
import com.kh.team.domain.SghAreaVo;
import com.kh.team.domain.SghBookSeatVo;
import com.kh.team.domain.SghBookingVo;
import com.kh.team.domain.SghMovieNameVo;
import com.kh.team.domain.SghMovieProductVo;
import com.kh.team.domain.SghTheaterVo;
import com.kh.team.sgh.service.SghAreaService;
import com.kh.team.sgh.service.SghBookingService;
import com.kh.team.sgh.service.SghMovieProductService;
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
	
	// 예매 첫 페이지
	@RequestMapping(value="/bookingView", method=RequestMethod.GET)
	public String bookingView(Model model, HttpSession session) throws Exception {
		session.removeAttribute("sghPaymentVo");
		session.removeAttribute("sghChoiceSeatDto");
		List<SghTheaterVo> theaterList = sghTheaterService.getTheaterList();
		List<SghAreaVo> areaList = sghAreaService.getAreaList();
		model.addAttribute("theaterList", theaterList);
		model.addAttribute("areaList", areaList);
		return "user/sgh/sgh_book/sgh_booking_view";
	}
	
	// 해당 영화관에 있는 영화 이름 에이잭스 요청
	@ResponseBody
	@RequestMapping(value="/getMovieName", method=RequestMethod.GET)
	public List<SghMovieNameVo> movieName(String theater_code) throws Exception {
		return sghMovieScheduleService.getMovieName(theater_code);
	}
	
	// 영화 일정
	@ResponseBody
	@RequestMapping(value="/movieSchedule", method=RequestMethod.GET)
	public List<SghBookingVo> getDayMovieList(String start_date, String movie_code) throws Exception {
		List<SghBookingVo> booking_list = sghBookingService.getChoiceMovieList(start_date, movie_code);
		return booking_list;
	}
	
	// 해당 영화에 대한 좌석 상황 에이잭스 요청
	@ResponseBody
	@RequestMapping(value="/movie_time_seat", method=RequestMethod.GET)
	public List<SghBookSeatVo> getMovieSeat(String movie_time_code) throws Exception {
		List<SghBookSeatVo> book_seat_list = sghBookingService.getTimeSeat(movie_time_code);
		return book_seat_list;
	}
}
