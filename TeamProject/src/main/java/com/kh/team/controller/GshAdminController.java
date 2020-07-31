package com.kh.team.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.kh.team.domain.GshReviewVo;
import com.kh.team.service.GshReviewService;

@Controller
@RequestMapping("/gsh/admin")
public class GshAdminController {
	
	@Inject
	GshReviewService gshReviewService;
	
	// 리뷰 관리 페이지
	@RequestMapping(value="/admin_review_list", method = RequestMethod.GET)
	public String admin_review_list(Model model) throws Exception {
		List<GshReviewVo> reviewList = gshReviewService.select_reviewAll();
		model.addAttribute("reviewList", reviewList);
		System.out.println("reviewList:" + reviewList);
		return "user/gsh/admin/admin_review_list";
	}
	
	// 관리자 리뷰 삭제
	@RequestMapping(value = "/admin_review_delete", method = RequestMethod.GET)
	public void admin_review_delete(int review_num) throws Exception {
		gshReviewService.admin_review_delete(review_num);
	}
	
	// 관리자 리뷰 검색
	public void admin_review_search() throws Exception {
		
	}

}
