package com.kh.team.controller;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.kh.team.domain.GshReviewVo;
import com.kh.team.service.GshReviewService;

@Controller
@RequestMapping("/gsh/movie")
public class GshController {
	
	@Inject
	private GshReviewService gshReviewService;
	
	// 리뷰 목록
	@RequestMapping(value = "/reviewList", method = RequestMethod.GET)
	public String review(Model model) throws Exception {
//		System.out.println("movie");
		// TODO 서비스 통해서 요청할것 (임시데이터)
		
		List<GshReviewVo> list = new ArrayList<GshReviewVo>();
		
		for (int i = 1; i < 10; i++) {
			
			GshReviewVo gshReviewVo = new GshReviewVo();
					// ()값은 임시로 넣어둠
					gshReviewVo.setUser_id("작성자" + i);
					gshReviewVo.setReview_num(i);
					gshReviewVo.setReview_date(new Timestamp(100000L));
					gshReviewVo.setReview_score(i);
					gshReviewVo.setMovie_code("일본침몰" + i);
					list.add(gshReviewVo);
		}
		
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
	
	// 베스트 리스트
	@RequestMapping(value = "/bestList", method = RequestMethod.GET)
	public String bestList(Model model) throws Exception {
		
		return "user/gsh/movie/bestList";
	}
	
	// 신작 리스트
	@RequestMapping(value = "/newList", method = RequestMethod.GET)
	public String newList() throws Exception {
		return "user/gsh/movie/newList";
	}
	
	// 상영작 리스트
	@RequestMapping(value = "/onairList", method = RequestMethod.GET)
	public String onairList() throws Exception {
		return "user/gsh/movie/onairList";
	}
	
}
