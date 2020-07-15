package com.kh.team.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.kh.team.domain.GshMovieDto;
import com.kh.team.domain.GshMovieListVo;
import com.kh.team.service.GshBestListService;
import com.kh.team.service.GshNewListService;
import com.kh.team.service.GshOnAirListService;
import com.kh.team.service.GshReviewService;

@Controller
@RequestMapping("/gsh/movie")
public class GshController {
	
	@Inject
	private GshReviewService gshReviewService;
	
	@Inject
	private GshBestListService gshBestListService;
	
	@Inject
	private GshNewListService gshNewListService;
	
	@Inject
	private GshOnAirListService gshOnAirListService;
	
	// 리뷰 목록
	@RequestMapping(value = "/reviewList", method = RequestMethod.GET)
	public String review(Model model) throws Exception {
		List<GshMovieDto> list = gshReviewService.select_review_code();
		System.out.println("list:" + list);
		model.addAttribute("list", list);
		return "user/gsh/movie/reviewList";
	}
	
	// 리뷰 작성 폼
	@RequestMapping(value = "/review_write_form", method = RequestMethod.GET)
	public String review_form() throws Exception {
		return "user/gsh/movie/review_write_form";
	}
	
	// 리뷰 내용 작성
	@RequestMapping(value = "/reviewContent", method = RequestMethod.GET)
	public String reviewContent() throws Exception {
		return "user/gsh/movie/reviewContent";
	}
	
	// 리뷰 내용 수정
//	@RequestMapping(value = "/reviewContent", method = RequestMethod.GET)
//	public String reviewModify() throws Exception {
//		return null;
//	}
	
	// 리뷰 삭제
	@RequestMapping(value = "/reviewContent", method = RequestMethod.POST)
	public String reviewDelete() throws Exception {
		return "user/gsh/movie/reviewList";
	}
	
	// 베스트 리스트
	@RequestMapping(value = "/bestList", method = RequestMethod.GET)
	public String bestList(Model model) throws Exception {
		List<GshMovieListVo> list = gshBestListService.select_movie_list();
		System.out.println(list);
		model.addAttribute("list", list);
		return "user/gsh/movie/bestList";
	}
	
	// 신작 리스트
	@RequestMapping(value = "/newList", method = RequestMethod.GET)
	public String newList(Model model) throws Exception {
		List<GshMovieListVo> list = gshNewListService.select_movie_list();
		model.addAttribute("list", list);
		return "user/gsh/movie/newList";
	}
	
	// 상영작 리스트
	@RequestMapping(value = "/onairList", method = RequestMethod.GET)
	public String onairList(Model model) throws Exception {
		List<GshMovieListVo> list = gshOnAirListService.select_movie_list();
		model.addAttribute("list", list);
		return "user/gsh/movie/onairList";
	}
	
}
