package com.kh.team.jmh.controller;

import java.sql.Date;
import java.util.Calendar;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.team.domain.JmhAreaVo;
import com.kh.team.domain.JmhEventVo;
import com.kh.team.domain.JmhMovieTheaterDto;
import com.kh.team.domain.JmhMovieTheaterVo;
import com.kh.team.domain.JmhTheaterScheduleVo;
import com.kh.team.jmh.service.JmhEventService;
import com.kh.team.jmh.service.JmhMovieTheaterService;
import com.kh.team.jmh.util.DateChange;

@Controller
@RequestMapping("/jmh/theater")
public class JmhController {
	
	@Inject
	private JmhMovieTheaterService jmhMovieTheaterService;
	
	@Inject
	private JmhEventService jmhEventService;

	@RequestMapping(value="/theaterView", method = RequestMethod.GET)
	public String theaterView(Model  model, String theater_code) throws Exception {
		
		// 지역가져오기
		List<JmhAreaVo> areaVo = jmhMovieTheaterService.getArea();
		
		// 오늘날짜 만들기
		Calendar cal = Calendar.getInstance();
		int year = cal.get(Calendar.YEAR);
		int month = cal.get(Calendar.MONTH) + 1;
		int day = cal.get(Calendar.DAY_OF_MONTH);
		
		String date = year + "-" + month + "-" + day;
		Date event_date =  java.sql.Date.valueOf(date);
		
		String movie_date = year + "-" + DateChange.dateChange(month) + "-" + DateChange.dateChange(day);
		
		// 이벤트 3개 가져오기
		List<JmhEventVo> eventVo = jmhEventService.selectEventThree(event_date);
		
		if(theater_code == null || theater_code == "") {
			theater_code = jmhMovieTheaterService.getTheaterCode();
		} 
		
		// 영화관 정보 가져오기
		JmhMovieTheaterVo mTheaterVo = jmhMovieTheaterService.getTheaterInformation(theater_code);
		// 영화관 총 좌석수 가져오기
		int totalSeat = jmhMovieTheaterService.getTotalSeat(theater_code);
		// 영화관 상영관 수 가져오기
		int screenCount = jmhMovieTheaterService.getScreenCount(theater_code);
		// 상영 영화제목 가져오기
		List<JmhMovieTheaterDto> mTheaterDto = jmhMovieTheaterService.getTheaterScheduleMovieName(theater_code, movie_date);
		
		
		// 오늘 날짜로 해당 영화관 일정 가져오기
		List<JmhTheaterScheduleVo> tScheduleVo = jmhMovieTheaterService.getTheaterSchedule(theater_code, movie_date);
		
		model.addAttribute("totalSeat", totalSeat);
		model.addAttribute("screenCount", screenCount);
		model.addAttribute("mTheaterVo", mTheaterVo);
		model.addAttribute("eventVo", eventVo);
		model.addAttribute("areaVo", areaVo);
		model.addAttribute("tScheduleVo", tScheduleVo);
		model.addAttribute("mTheaterDto", mTheaterDto);
		return "user/jmh/jmh_theater/jmh_theater";
	}
	
	// 지역 선택시 영화관 목록 보여주기
	@ResponseBody
	@RequestMapping(value="/theaterInfo", method = RequestMethod.GET)
	public List<JmhMovieTheaterVo> theaterInfo(String area_code) throws Exception {
		List<JmhMovieTheaterVo> movieTheaterVo = jmhMovieTheaterService.getTheaterName(area_code);
		return movieTheaterVo;
	}
	
	// 관리자 페이지
	@RequestMapping(value="/admin", method = RequestMethod.GET)
	public String admin() throws Exception {
		return "admin/admin";
	}
	
	// 이벤트 페이지
	@RequestMapping(value="/event", method = RequestMethod.GET)
	public String event() throws Exception {
		return "event/event";
	}
	
	// Ajax 요청 - 선택한 날짜에 맞게 영화데이터 가져가기
	@ResponseBody
	@RequestMapping(value="/dateGetMovieData", method = RequestMethod.GET)
	public List<JmhMovieTheaterDto> ajaxSelectDategetMovieData(String theater_code, String movie_date) throws Exception {
		List<JmhMovieTheaterDto> mTheaterDtoAjax = jmhMovieTheaterService.getTheaterScheduleMovieName(theater_code, movie_date);
		return mTheaterDtoAjax;
	}
	
	// Ajax 요청 - 선택한 날짜에 맞게 영화 서브데이터 가져가기
	@ResponseBody
	@RequestMapping(value="/dateGetMovieSubData", method = RequestMethod.GET)
	public List<JmhTheaterScheduleVo> ajaxSelectDategetMovieSubData(String theater_code, String movie_date) throws Exception {
		List<JmhTheaterScheduleVo> tScheduleVoAjax = jmhMovieTheaterService.getTheaterSchedule(theater_code, movie_date);
		return tScheduleVoAjax;
	}
}