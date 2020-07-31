package com.kh.team.sgh.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.kh.team.domain.SghBuyListVo;
import com.kh.team.domain.SghMyMovieBuyVo;
import com.kh.team.domain.SghPagingDto;
import com.kh.team.domain.SghPointListVo;
import com.kh.team.sgh.service.SghMyPageService;
import com.kh.team.sgh.service.SghPointService;

@Controller
@RequestMapping("/sgh/myPage")
public class SghMyPageController {

	@Inject
	private SghMyPageService sghMyPageService;
	@Inject
	private SghPointService sghPointService;
	
	// 영화 구매 내역 폼
	@RequestMapping(value="/movieBuyForm", method=RequestMethod.GET)
	public String movieBuyForm(HttpSession session, Model model) throws Exception {
		String user_id = (String)session.getAttribute("user_id");
		List<SghMyMovieBuyVo> sghMyMovieBuyVo = sghMyPageService.getMyMovieBuyList(user_id);
		model.addAttribute("sghMyMovieBuyVo", sghMyMovieBuyVo);
		return "user/sgh/sgh_myPage/sgh_buyMovieList";
	}
	
	// 포인트 내역 폼
	@RequestMapping(value="/pointList", method=RequestMethod.GET)
	public String pointListForm(HttpSession session, Model model) throws Exception {
		String user_id = (String)session.getAttribute("user_id");
		List<SghPointListVo> point_list = sghPointService.getPointList(user_id);
		model.addAttribute("point_list", point_list);
		return "user/sgh/sgh_myPage/sgh_pointList";
	}
	
	// 영화 예매 폼
	@RequestMapping(value="/bookingForm", method=RequestMethod.GET)
	public String bookingForm(SghPagingDto sghPagingDto, HttpSession session, Model model) throws Exception {
		int total_count = sghMyPageService.getBuyTotal();
		sghPagingDto.setTotal_count(total_count);
		sghPagingDto.setPageInfo();
		String user_id = (String)session.getAttribute("user_id");
		int start_row = sghPagingDto.getStart_row();
		int end_row = sghPagingDto.getEnd_row();
		List<SghBuyListVo> movieBuyList = sghMyPageService.getBuyList(start_row, end_row, user_id);
		model.addAttribute("movieBuyList", movieBuyList);
		model.addAttribute("sghPagingDto", sghPagingDto);
		return "user/sgh/sgh_myPage/sgh_booking_form";
	}
	
	// 시간이 지나지 않은 영화 예매 폼
	@RequestMapping(value="/outBookingForm", method=RequestMethod.GET)
	public String outBookingForm(SghPagingDto sghPagingDto, HttpSession session, Model model) throws Exception {
		int total_count = sghMyPageService.getOutBuyTotal();
		sghPagingDto.setTotal_count(total_count);
		sghPagingDto.setPageInfo();
		String user_id = (String)session.getAttribute("user_id");
		int start_row = sghPagingDto.getStart_row();
		int end_row = sghPagingDto.getEnd_row();
		List<SghBuyListVo> movieBuyList = sghMyPageService.getOutBuyList(start_row, end_row, user_id);
		model.addAttribute("movieBuyList", movieBuyList);
		model.addAttribute("sghPagingDto", sghPagingDto);
		return "user/sgh/sgh_myPage/sgh_out_booking_form";
	}
}
