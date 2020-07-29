package com.kh.team;

import java.util.List;
import java.util.Locale;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.kh.team.domain.JmhMovieBest3Vo;
import com.kh.team.domain.JmhMovieVo;
import com.kh.team.jmh.service.JmhMovieBest3Service;

@Controller
public class HomeController {
	
	@Inject
	private JmhMovieBest3Service jmhMovieBest3Service;
	
	// jmh 영화 best 작업
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) throws Exception {
		//영화 best3 가져오기
		List<JmhMovieBest3Vo> jmhMovieBest3Vo = jmhMovieBest3Service.getMovieBest3();
		// 영화 올린순으로 8개 가져오기
		List<JmhMovieVo> jmhMovieVo = jmhMovieBest3Service.selectMovie8();
		
		model.addAttribute("jmhMovieBest3Vo", jmhMovieBest3Vo);
		model.addAttribute("jmhMovieVo", jmhMovieVo);
		return "/main/main";
	}
}