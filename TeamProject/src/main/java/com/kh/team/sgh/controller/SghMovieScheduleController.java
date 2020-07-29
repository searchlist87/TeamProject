package com.kh.team.sgh.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.team.domain.SghPagingDto;
import com.kh.team.domain.SghScheduleListDto;
import com.kh.team.domain.SghScheduleVo;
import com.kh.team.domain.SghTheaterVo;
import com.kh.team.sgh.service.SghMovieScheduleService;
import com.kh.team.sgh.service.SghMovieService;
import com.kh.team.sgh.service.SghTheaterService;

@Controller
@RequestMapping("/sgh/admin/schedule")
public class SghMovieScheduleController {

	@Inject
	private SghMovieScheduleService sghMovieScheduleService;
	@Inject
	private SghMovieService sghMovieService;
	@Inject
	private SghTheaterService sghTheaterService;
	
	// 영화 스케쥴 리스트 폼으로
	@RequestMapping(value="/scheduleList", method=RequestMethod.GET)
	public String scheduleList(SghPagingDto sghPagingDto, Model model) throws Exception {
		List<SghScheduleVo> schedule_list = sghMovieScheduleService.getScheduleList(sghPagingDto);
		model.addAttribute("schedule_list", schedule_list);
		return "user/sgh/sgh_admin/sgh_movie_schedule/sgh_movie_schedule_list";
	}
	
	// 영화 스케쥴 등록으로
	@RequestMapping(value="/scheduleRegist", method=RequestMethod.GET)
	public String scheduleRegist(Model model) throws Exception {
		List<SghScheduleListDto> schedule_list = sghMovieService.getScheduleMovieList();
		List<SghTheaterVo> theater_list = sghTheaterService.getTheaterList();
		
		model.addAttribute("schedule_list", schedule_list);
		model.addAttribute("theater_list", theater_list);
		return "user/sgh/sgh_admin/sgh_movie_schedule/sgh_movie_schedule_regist";
	}
	
	// 영화 스케쥴 등록 처리
	@RequestMapping(value="/scheduleRegistRun", method=RequestMethod.GET)
	public String scheduleRegistRun(SghScheduleVo sghScheduleVo, RedirectAttributes rttr) {
		try {
			sghMovieScheduleService.insertMovieSchedule(sghScheduleVo);
			return "redirect:/sgh/admin/schedule/scheduleList";
		} catch (Exception e) {
			e.printStackTrace();
		}
		rttr.addFlashAttribute("result", "false");
		return "redirect:/sgh/admin/schedule/scheduleRegist";
	}
	
	// 영화 스케쥴 수정으로
	@RequestMapping(value="/scheduleModify", method=RequestMethod.GET)
	public String scheduleModify(String movie_schedule_code, Model model) throws Exception {
		List<SghScheduleListDto> schedule_list = sghMovieService.getScheduleMovieList();
		List<SghTheaterVo> theater_list = sghTheaterService.getTheaterList();
		SghScheduleVo schedule_vo = sghMovieScheduleService.getMovieScheduleOne(movie_schedule_code);
		model.addAttribute("schedule_list", schedule_list);
		model.addAttribute("theater_list", theater_list);
		model.addAttribute("schedule_vo", schedule_vo);
		
		return "user/sgh/sgh_admin/sgh_movie_schedule/sgh_movie_schedule_modify";
	}
	
	// 영화 스케쥴 수정 처리
	@RequestMapping(value="/scheduleModifyRun", method=RequestMethod.GET)
	public String scheduleModifyRun(SghScheduleVo sghScheduleVo, RedirectAttributes rttr) throws Exception {
		System.out.println("sghScheduleVo :" + sghScheduleVo);
		try {
			sghMovieScheduleService.updateSchedule(sghScheduleVo);
			return "redirect:/sgh/admin/schedule/scheduleList";
		} catch (Exception e) {
			e.printStackTrace();
		}
		rttr.addFlashAttribute("result", "false");
		return "redirect:/sgh/admin/schedule/scheduleModify?movie_schedule_code=" + sghScheduleVo.getMovie_schedule_code();
	}
}
