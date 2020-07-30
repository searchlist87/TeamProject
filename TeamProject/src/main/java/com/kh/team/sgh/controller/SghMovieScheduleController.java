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
		int total_count = sghMovieScheduleService.getMovieScheduleCount();
		sghPagingDto.setTotal_count(total_count);
		sghPagingDto.setPageInfo();
		List<SghScheduleVo> schedule_list = sghMovieScheduleService.getScheduleList(sghPagingDto);
		model.addAttribute("schedule_list", schedule_list);
		model.addAttribute("sghPagingDto", sghPagingDto);
		return "user/sgh/sgh_admin/sgh_movie_schedule/sgh_movie_schedule_list";
	}
	
	// 삭제된 영화 스케쥴 리스트 폼으로
	@RequestMapping(value="/deleteScheduleList", method=RequestMethod.GET)
	public String deleteScheduleList(SghPagingDto sghPagingDto, Model model) throws Exception {
		int total_count = sghMovieScheduleService.getDeleteScheduleCount();
		sghPagingDto.setTotal_count(total_count);
		sghPagingDto.setPageInfo();
		List<SghScheduleVo> schedule_list = sghMovieScheduleService.deleteScheduleList(sghPagingDto);
		model.addAttribute("schedule_list", schedule_list);
		model.addAttribute("sghPagingDto", sghPagingDto);
		return "user/sgh/sgh_admin/sgh_movie_schedule/sgh_movie_delete_schedule_list";
	}
	
	// end 시간이 지난 영화작 목록
	@RequestMapping(value="/endOutScheduleList", method=RequestMethod.GET)
	public String endOutScheduleList(SghPagingDto sghPagingDto, Model model) throws Exception {
		int total_count = sghMovieScheduleService.getDeleteScheduleCount();
		sghPagingDto.setTotal_count(total_count);
		sghPagingDto.setPageInfo();
		List<SghScheduleVo> schedule_list = sghMovieScheduleService.endDateOutScheduleList(sghPagingDto);
		System.out.println("schedule_list :" + schedule_list);
		model.addAttribute("schedule_list", schedule_list);
		model.addAttribute("sghPagingDto", sghPagingDto);
		return "user/sgh/sgh_admin/sgh_movie_schedule/sgh_end_out_schedule_list";
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
	
	// 영화 삭제 처리
	@RequestMapping(value="/deleteMovieSchedule", method=RequestMethod.GET)
	public String deleteMovieSchedule(String movie_schedule_code, RedirectAttributes rttr) throws Exception {
		try {
			sghMovieScheduleService.stateDeleteSchedule(movie_schedule_code);
			return "redirect:/sgh/admin/schedule/scheduleList";
		} catch (Exception e) {
			e.printStackTrace();
		}
		rttr.addFlashAttribute("delete_result", "false");
		return "redirect:/sgh/admin/schedule/scheduleList";
	}
	
	// 영화 복구 처리
	@RequestMapping(value="/restoreMovieSchedule", method=RequestMethod.GET)
	public String restoreMovieSchedule(String movie_schedule_code, RedirectAttributes rttr) throws Exception {
		try {
			sghMovieScheduleService.stateRestoreSchedule(movie_schedule_code);
			return "redirect:/sgh/admin/schedule/scheduleList";
		} catch (Exception e) {
			e.printStackTrace();
		}
		rttr.addFlashAttribute("restore_result", "false");
		return "redirect:/sgh/admin/schedule/scheduleList";
	}
}
