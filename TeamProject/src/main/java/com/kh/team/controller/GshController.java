package com.kh.team.controller;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.kh.team.domain.GshReviewVo;
import com.kh.team.service.GshReviewService;

@Controller
@RequestMapping("/gsh/movie")
public class GshController {
	
	@Inject
	private GshReviewService gshReviewService;
	
	@RequestMapping(value = "/reviewList", method = RequestMethod.GET)
	public String review(Model model) throws Exception {
//		System.out.println("movie");
		// TODO 서비스 통해서 요청할것 (임시데이터)
		
		List<GshReviewVo> list = new ArrayList<GshReviewVo>();
		
		for (int i = 1; i < 11; i++) {
			
			GshReviewVo gshReviewVo = new GshReviewVo();
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
	
	@RequestMapping(value = "/review_form", method = RequestMethod.GET)
	public String review_form() throws Exception {
		return "user/gsh/movie/review_form";
	}

}
