package com.kh.team.sgh.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.team.domain.SghMovieScreenAjaxDto;
import com.kh.team.domain.SghMovieTimeAjaxDto;
import com.kh.team.domain.SghMovieTimeListVo;
import com.kh.team.domain.SghMovieTimeModifyVo;
import com.kh.team.domain.SghMovieTimeVo;
import com.kh.team.domain.SghPagingDto;
import com.kh.team.domain.SghScheduleVo;
import com.kh.team.domain.SghScreenSeatVo;
import com.kh.team.sgh.service.SghMovieScheduleService;
import com.kh.team.sgh.service.SghMovieScreenService;
import com.kh.team.sgh.service.SghMovieTimeService;

@Controller
@RequestMapping(value="/sgh/admin/movieTime")
public class SghMovieTimeController {
	
	@Inject
	private SghMovieScheduleService sghMovieScheduleService;
	@Inject
	private SghMovieTimeService sghMovieTimeService;
	@Inject
	private SghMovieScreenService sghMovieScreenService;
	
	// 기간이 지나지 않고 삭제되지 않은 상영 회차 조회 폼으로
	@RequestMapping(value="/movieTimeList", method=RequestMethod.GET)
	public String movieTimeList(SghPagingDto sghPagingDto, Model model) throws Exception {
		int total_count = sghMovieTimeService.getMovieTimeCount(sghPagingDto);
		sghPagingDto.setTotal_count(total_count);
		sghPagingDto.setPageInfo();
		List<SghMovieTimeListVo> time_list = sghMovieTimeService.getMovieTimeList(sghPagingDto);
		model.addAttribute("time_list", time_list);
		model.addAttribute("sghPagingDto", sghPagingDto);
		return "user/sgh/sgh_admin/sgh_movie_time/sgh_movie_time_list";
	}
	
	// 삭제된 상영 회차 조회 폼으로
	@RequestMapping(value="/deleteMovieTimeList", method=RequestMethod.GET)
	public String deleteMovieTimeList(SghPagingDto sghPagingDto, Model model) throws Exception {
		int total_count = sghMovieTimeService.deleteMovieTimeCount(sghPagingDto);
		sghPagingDto.setTotal_count(total_count);
		sghPagingDto.setPageInfo();
		List<SghMovieTimeListVo> time_list = sghMovieTimeService.deleteMovieTimeList(sghPagingDto);
		model.addAttribute("time_list", time_list);
		model.addAttribute("sghPagingDto", sghPagingDto);
		return "user/sgh/sgh_admin/sgh_movie_time/sgh_delete_movie_time_list";
	}
	
	// 기간이 지나고 삭제되지않은 상영 회차 조회 폼으로
	@RequestMapping(value="/endOupMovieTimeList", method=RequestMethod.GET)
	public String endOupMovieTimeList(SghPagingDto sghPagingDto, Model model) throws Exception {
		int total_count = sghMovieTimeService.endOutMovieTimeCount(sghPagingDto);
		sghPagingDto.setTotal_count(total_count);
		sghPagingDto.setPageInfo();
		List<SghMovieTimeListVo> time_list = sghMovieTimeService.endOutMovieTimeList(sghPagingDto);
		model.addAttribute("time_list", time_list);
		model.addAttribute("sghPagingDto", sghPagingDto);
		return "user/sgh/sgh_admin/sgh_movie_time/sgh_end_out_movie_time_list";
	}
	
	// 삭제하기
	@RequestMapping(value="/deleteMovieTime", method=RequestMethod.GET)
	public String deleteMovieTime(String movie_time_code, RedirectAttributes rttr) {
		try {
			sghMovieTimeService.deleteMovieTime(movie_time_code);
			return "redirect:/sgh/admin/movieTime/movieTimeList";
		} catch (Exception e) {
			e.printStackTrace();
		}
		rttr.addFlashAttribute("delete_result", false);
		return "redirect:/sgh/admin/movieTime/movieTimeList";
	}
	
	// 복구하기
	@RequestMapping(value="/restoreMovieTime", method=RequestMethod.GET)
	public String restoreMovieTime(String movie_time_code, RedirectAttributes rttr) {
		try {
			sghMovieTimeService.restoreMovieTime(movie_time_code);
			return "redirect:/sgh/admin/movieTime/movieTimeList";
		} catch (Exception e) {
			e.printStackTrace();
		}
		rttr.addFlashAttribute("delete_result", false);
		return "redirect:/sgh/admin/movieTime/movieTimeList";
	}

	// 상영 회차 등록 폼으로
	@RequestMapping(value="/movieTimeRegist", method=RequestMethod.GET)
	public String movieTimeRegist(SghPagingDto sghPagingDto, Model model) throws Exception {
		List<SghScheduleVo> schedule_list = sghMovieScheduleService.getScheduleList(sghPagingDto);
		model.addAttribute("schedule_list", schedule_list);		
		return "user/sgh/sgh_admin/sgh_movie_time/sgh_movie_time_regist";
	}
	
	// 등록된 상영 에이잭스 요청
	@ResponseBody
	@RequestMapping(value="/choiceSchedule", method=RequestMethod.GET)
	public SghMovieTimeAjaxDto choiceAjaxSchedule(String movie_schedule_code) throws Exception {
		SghMovieTimeAjaxDto time_ajax_dto = sghMovieTimeService.getAjaxScheduleOne(movie_schedule_code);
		System.out.println("time_ajax_dto :" + time_ajax_dto);
		return time_ajax_dto;
	}

	// 에이잭스 요청한 상영에 등록된 상영관 에이잭스 요청
	@ResponseBody
	@RequestMapping(value="/getScreenList", method=RequestMethod.GET)
	public List<SghMovieScreenAjaxDto> getAjaxScreenList(String theater_code) throws Exception {
		List<SghMovieScreenAjaxDto> screen_ajax = sghMovieTimeService.getAjaxScreenList(theater_code);
		System.out.println("screen_ajax :" + screen_ajax);
		return screen_ajax;
	}
	
	// 등록 작업
	@RequestMapping(value="/registMovieTime", method=RequestMethod.GET)
	public String registMovieTime(SghMovieTimeVo sghMovieTimeVo, SghScreenSeatVo sghScreenSeatVo, RedirectAttributes rttr) {
		System.out.println("sghMovieTimeVo :" + sghMovieTimeVo);
		try {
			sghMovieTimeService.insertMovieTime(sghMovieTimeVo);
			return "redirect:/sgh/admin/movieTime/movieTimeList";
		} catch (Exception e) {
			e.printStackTrace();
		}
		rttr.addFlashAttribute("result", "false");
		return "redirect:/sgh/admin/movieTime/movieTimeRegist";
	}
	
	// 상영 회차 수정 폼으로
	@RequestMapping(value="/movieTimeModify", method=RequestMethod.GET)
	public String movieTimeModify(String movie_time_code, Model model) throws Exception {
		SghMovieTimeModifyVo movie_time_vo = sghMovieTimeService.selectMovieTimeOne(movie_time_code);
		String theater_code = movie_time_vo.getTheater_code();
		List<SghMovieScreenAjaxDto> screen_list_dto = sghMovieTimeService.getAjaxScreenList(theater_code);
		model.addAttribute("movie_time_vo", movie_time_vo);
		model.addAttribute("screen_list_dto", screen_list_dto);
		return "user/sgh/sgh_admin/sgh_movie_time/sgh_movie_time_modify";
	}
	
	// 상영 회차 수정 처리
	@RequestMapping(value="/movieTimeModifyRun", method=RequestMethod.GET)
	public String movieTimeModifyRun(SghMovieTimeVo sghMovieTimeVo, RedirectAttributes rttr) {
		String movie_time_code = sghMovieTimeVo.getMovie_time_code();
		try {
			sghMovieTimeService.modifyMovieTime(sghMovieTimeVo);
			return "redirect:/sgh/admin/movieTime/movieTimeList";
		} catch (Exception e) {
			e.printStackTrace();
		}
		rttr.addFlashAttribute("result", "false");
		return "redirect:/sgh/admin/movieTime/movieTimeModify?movie_time_code=" + movie_time_code;
	}
	
	// 스크린 시트 총 수, 행, 열 에이잭스 요청
	@ResponseBody
	@RequestMapping(value="/screenSeatAjax", method=RequestMethod.GET)
	public SghScreenSeatVo screenSeatAjax(String screen_code) throws Exception {
		SghScreenSeatVo screen_seat_vo = sghMovieScreenService.getScreenSeat(screen_code);
		return screen_seat_vo;
	}
}
