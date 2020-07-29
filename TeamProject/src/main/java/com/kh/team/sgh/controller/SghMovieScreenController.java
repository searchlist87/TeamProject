package com.kh.team.sgh.controller;

import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.team.domain.SghMovieScreenVo;
import com.kh.team.domain.SghPagingDto;
import com.kh.team.domain.SghScreenPagingVo;
import com.kh.team.domain.SghScreenRegistDto;
import com.kh.team.domain.SghTheaterVo;
import com.kh.team.sgh.service.SghMovieScreenService;
import com.kh.team.sgh.service.SghTheaterService;
import com.kh.team.sgh.util.SghAsciiChangeUtil;

@Controller
@RequestMapping("/sgh/admin/movieScreen")
public class SghMovieScreenController {

	@Inject
	private SghMovieScreenService sghMovieScreenService;
	@Inject
	private SghTheaterService sghTheaterService;
	
	// 상영관 리스트 폼으로
	@RequestMapping(value="/screenList", method=RequestMethod.GET)
	public String screenList(SghPagingDto sghPagingDto, String theater_code, Model model) throws Exception {
		// 상영관 페이징 작업
		int total_count = sghMovieScreenService.getScreenTotal(theater_code);
		sghPagingDto.setTotal_count(total_count);
		sghPagingDto.setPageInfo();
		int start_row = sghPagingDto.getStart_row();
		int end_row = sghPagingDto.getEnd_row();
		SghScreenPagingVo sghScreenPagingVo = new SghScreenPagingVo();
		sghScreenPagingVo.setStart_row(start_row);
		sghScreenPagingVo.setEnd_row(end_row);
		sghScreenPagingVo.setTheater_code(theater_code);
		List<SghMovieScreenVo> screen_list = sghMovieScreenService.getScreenList(sghScreenPagingVo);
		SghTheaterVo sghTheaterVo = sghTheaterService.selectOneTheater(theater_code);
		model.addAttribute("screen_list", screen_list);
		model.addAttribute("sghTheaterVo", sghTheaterVo);
		return "user/sgh/sgh_admin/sgh_admin_movie_screen/sgh_screen_list";
	}
	
	// 상영관 삭제 처리
	@RequestMapping(value="/deleteScreen", method=RequestMethod.GET)
	public String deleteScreen(String screen_code, String theater_code, RedirectAttributes rttr) {
		try {
			sghMovieScreenService.stateDeleteScreen(screen_code);
			return "redirect:/sgh/admin/movieScreen/screenList?theater_code=" + theater_code; 
		} catch (Exception e) {
			e.printStackTrace();
		}
		rttr.addFlashAttribute("delete_result", "false");
		return "redirect:/sgh/admin/movieScreen/screenList?theater_code=" + theater_code; 
	}
	
	// 상영관 수정 폼으로
	@RequestMapping(value="/screenModify", method=RequestMethod.GET)
	public String screenModify(String screen_code, Model model, RedirectAttributes rttr) throws Exception {
		int productCheck = sghMovieScreenService.productCheck(screen_code);
		SghMovieScreenVo sghMovieScreenVo = sghMovieScreenService.getScreenOne(screen_code);
		String theater_code = sghMovieScreenVo.getTheater_code();
		System.out.println("productCheck :" + productCheck);
		if(productCheck < 1) {
			model.addAttribute("sghMovieScreenVo", sghMovieScreenVo);
			return "user/sgh/sgh_admin/sgh_admin_movie_screen/sgh_screen_modify";
		}
		rttr.addFlashAttribute("result", "false");
		return "redirect:/sgh/admin/movieScreen/screenList?theater_code=" + theater_code; 
	}
	
	// 상영관 수정 처리
	@RequestMapping(value="/screenModifyRun", method=RequestMethod.GET)
	public String screenModifyRun(SghMovieScreenVo sghMovieScreenVo, RedirectAttributes rttr) {
		String theater_code = sghMovieScreenVo.getTheater_code();
		int row = sghMovieScreenVo.getScreen_seat_row();
		int col = sghMovieScreenVo.getScreen_seat_col();
		try {
			ArrayList<String> rws = SghAsciiChangeUtil.col_make(row, col);
			sghMovieScreenService.screenModify(sghMovieScreenVo, rws);
			return "redirect:/sgh/admin/movieScreen/screenList?theater_code=" + theater_code;
		} catch (Exception e) {
			e.printStackTrace();
		}
		boolean result = false;
		String screen_code = sghMovieScreenVo.getScreen_code();
		rttr.addFlashAttribute("result", result);
		return "redirect:/sgh/admin/movieScreen/screenModify?screen_code=" + screen_code;
	}
	
	// 상영관 등록 폼으로
	@RequestMapping(value="/screenRegist", method=RequestMethod.GET)
	public String screenRegist(SghScreenRegistDto sghScreenRegistDto, String theater_name, Model model) throws Exception {
		sghScreenRegistDto.setTheater_name(theater_name);
		model.addAttribute("sghScreenRegistDto", sghScreenRegistDto);
		return "user/sgh/sgh_admin/sgh_admin_movie_screen/sgh_screen_regist";
	}
	
	// 상영관 등록 처리
	@RequestMapping(value="/screenRegistRun", method=RequestMethod.GET)
	public String screenRegistRun(SghMovieScreenVo sghMovieScreenVo, String theater_name, RedirectAttributes rttr) {
		String theater_code = sghMovieScreenVo.getTheater_code();
		int row = sghMovieScreenVo.getScreen_seat_row();
		int col = sghMovieScreenVo.getScreen_seat_col();
		try {
			ArrayList<String> rws = SghAsciiChangeUtil.col_make(row, col);
			sghMovieScreenService.insertScreen(sghMovieScreenVo, rws);
			return "redirect:/sgh/admin/movieScreen/screenList?theater_code=" + theater_code;
		} catch (Exception e) {
			e.printStackTrace();
		}
		boolean result = false;
		rttr.addFlashAttribute("result", result);
		return "redirect:/sgh/admin/movieScreen/screenRegist?theater_code=" + theater_code + "&theater_name=" + theater_name;
	}
}
