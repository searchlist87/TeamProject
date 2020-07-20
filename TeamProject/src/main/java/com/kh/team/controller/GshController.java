package com.kh.team.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.kh.team.domain.GshMovieDto;
import com.kh.team.service.GshMovieService;
import com.kh.team.service.GshReviewService;

@Controller
@RequestMapping("/gsh/movie")
public class GshController {
	
	@Inject
	private GshReviewService gshReviewService;
	
	@Inject
	private GshMovieService gshMovieService;
	
	// 리뷰 목록
	@RequestMapping(value = "/reviewList", method = RequestMethod.GET)
	public String review(Model model) throws Exception {
		List<GshMovieDto> list = gshReviewService.select_review_code();
//		System.out.println("list:" + list);
		model.addAttribute("list", list);
		return "user/gsh/movie/reviewList";
	}
	
	//
	
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
	
	// 영화 리뷰 목차
	@RequestMapping(value = "/movieView", method = RequestMethod.GET)
	public String movieView(Model model) throws Exception {
		List<GshMovieDto> list = gshMovieService.select_movie_list();
//		System.out.println(list);
		model.addAttribute("list", list);
		return "user/gsh/movie/movieView";
	}
	
//	 영화 상세 정보 보기
	@RequestMapping(value = "/movieInfo", method = RequestMethod.GET)
	public String movieInfo(String movie_code, Model model) throws Exception {
		System.out.println("movie_code:" + movie_code);
//		List<GshMovieDto> list = gshMovieService.select_movie_list();
		GshMovieDto movieDto = gshMovieService.selectMovieCode(movie_code);
		List<String> subImageList = gshMovieService.selectMovieSubImage(movie_code);
		System.out.println("subImageList:" + subImageList);
		System.out.println("movieDto :" + movieDto);
		model.addAttribute("movieDto", movieDto);
		return "user/gsh/movie/movieInfo";
	}
	
	
	// 상영작 리스트
	@RequestMapping(value = "/onairList", method = RequestMethod.GET)
	public String onairList(Model model) throws Exception {
		List<GshMovieDto> list = gshMovieService.select_movie_list();
		model.addAttribute("list", list);
		return "user/gsh/movie/onairList";
	}
	
	
	
}
