package com.kh.team.sgh.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping(value="/sgh/admin/movieTime")
public class SghMovieTimeController {
	
	// 상영 회차 조회 폼으로
	@RequestMapping(value="/movieTimeList", method=RequestMethod.GET)
	public String movieTimeList() throws Exception {
		return "user/sgh/sgh_admin/sgh_movie_time/sgh_movie_time_list";
	}

	// 상영 회차 등록 폼으로
	@RequestMapping(value="/movieTimeRegist", method=RequestMethod.GET)
	public String movieTimeRegist() throws Exception {
		return "user/sgh/sgh_admin/sgh_movie_time/sgh_movie_time_regist";
	}
	
	// 상영 회차 수정 폼으로
	@RequestMapping(value="/movieTimeModify", method=RequestMethod.GET)
	public String movieTimeModify() throws Exception {
		return "user/sgh/sgh_admin/sgh_movie_time/sgh_movie_time_modify";
	}
}
