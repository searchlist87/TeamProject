package com.kh.team.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.team.domain.GshMovieDto;
import com.kh.team.domain.GshReviewVo;
import com.kh.team.service.GshMovieService;
import com.kh.team.service.GshReviewService;

@Controller
@RequestMapping("/gsh/movie")
public class GshController {
	
	@Inject
	private GshReviewService gshReviewService;
	
	@Inject
	private GshMovieService gshMovieService;
	
	 // 영화 폼 Get
	@RequestMapping(value = "/movieForm", method = RequestMethod.GET)
	public String movieFormGET() throws Exception {
		return "user/gsh/movie/movieForm";
	}
	
	 // 영화 폼 Post
	@RequestMapping(value = "/movieForm", method = RequestMethod.POST)
	public String movieFormPOST(@RequestBody GshReviewVo gshReviewVo) throws Exception {
//		System.out.println("GshController, write_review, gshReviewVo:" + gshReviewVo);
		gshReviewService.write_review(gshReviewVo);
		return "success";
	}
	
	// 리뷰 목록
	@RequestMapping(value = "/reviewList", method = RequestMethod.GET)
	public String reviewList(Model model) throws Exception {
		List<GshReviewVo> list = gshReviewService.select_reviewAll();
//		System.out.println("list:" + list);
		model.addAttribute("list", list);
		return "user/gsh/movie/movieInfo";
	}
	
	// 리뷰 내용 작성
	@ResponseBody
	@RequestMapping(value = "/write_review", method = RequestMethod.POST)
	public String reviewContent(HttpSession session, GshReviewVo gshReviewVo) throws Exception {
//		List<GshReviewVo> list = gshReviewService.write_review();
//		System.out.println("list:" + list);
//		System.out.println("GshController, write_review, gshReviewVo:" + gshReviewVo);
		String user_id = (String) session.getAttribute("user_id");
		if (user_id == null || user_id.equals("")) {
			return "fail";
		}
		gshReviewVo.setUser_id(user_id);
		gshReviewService.write_review(gshReviewVo);
		return "success";
	}
	
	// 리뷰 삭제
	// 삭제를 위해서 리뷰 번호를 ()에 넣어준다
	@RequestMapping(value = "/delete_review", method = RequestMethod.GET)
	public String reviewDelete(int review_num, HttpSession session) throws Exception {
		String user_id = (String)session.getAttribute("user_id");
//		System.out.println("user_id :" + user_id);
//		System.out.println("review_num:" + review_num);
		gshReviewService.delete_review(review_num, user_id);
		return "user/gsh/movie/movieInfo";
	}
	
	// 영화 목록
	@RequestMapping(value = "/movieView", method = RequestMethod.GET)
	public String movieView(Model model) throws Exception {
		List<GshMovieDto> list = gshMovieService.select_movieAll();
//		System.out.println(list);
		model.addAttribute("list", list);
		return "user/gsh/movie/movieView";
	}
	
//	 영화 상세 정보 보기
	@RequestMapping(value = "/movieInfo", method = RequestMethod.GET)
	public String movieInfo(HttpSession session, String movie_code, ModelMap model) throws Exception {
		GshMovieDto movieDto = gshMovieService.selectMovieCode(movie_code);
//		System.out.println("movieInfo, movieDto:" + movieDto);
		// 스틸컷 파일명 목록
		List<String> subImageList = gshMovieService.selectMovieSubImage(movie_code);
		List<GshReviewVo> reviewList = gshReviewService.selectReviewByCode(movie_code);
//		int review_score = gshReviewService.averageReviewScore(movie_code);
//		movieDto.setReview_score(review_score);
		model.addAttribute("movieDto", movieDto);
		model.addAttribute("subImageList", subImageList);
		model.addAttribute("reviewList", reviewList);
		return "user/gsh/movie/movieInfo";
	}
	
	// 영화 이름으로 영화 찾기
	public void findMovieName() throws Exception {
	}
	
	// 영화 장르로 영화 찾기
	public void findMovieGenre() throws Exception {
	}
	
	
	// 영화 코드로 리뷰 찾기
	@RequestMapping(value = "/reviewList/{movie_code}", method = RequestMethod.GET)
	@ResponseBody
	public List<GshReviewVo> reviewList(@PathVariable("movie_code") String movie_code) throws Exception {
	List<GshReviewVo> reviewList = gshReviewService.selectReviewByCode(movie_code);
	return reviewList;
	}
	
//	 댓글 수정
	@ResponseBody
	@RequestMapping(value = "/reviewModify", method = RequestMethod.GET)
	public void reviewModify(HttpSession session, Model model, int review_num, String review_content, int review_score) throws Exception {
		String user_id = (String) session.getAttribute("user_id");
		gshReviewService.update_review(review_content, review_score, review_num, user_id);
	}
	
}
