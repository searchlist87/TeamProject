package com.kh.team.sgh.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.team.sgh.domain.SghAreaVo;
import com.kh.team.sgh.domain.SghPagingDto;
import com.kh.team.sgh.domain.SghTheaterVo;
import com.kh.team.sgh.service.SghAreaService;
import com.kh.team.sgh.service.SghTheaterService;

@Controller
@RequestMapping("/sgh/admin")
public class SghAdminController {

	@Inject
	private SghAreaService sghAreaService;
	@Inject
	private SghTheaterService sghTheaterService;
	
	
//	 영화관 조회 폼 이동
	@RequestMapping(value="/adminMainForm", method=RequestMethod.GET)
	public String adminMainForm() throws Exception {
		return "user/sgh/sgh_admin/sgh_admin_main_form";
	}
	
	// 영화관 조회 폼 이동
	@RequestMapping(value="/movieTheaterList", method=RequestMethod.GET)
	public String movieTheaterListForm(SghPagingDto sghPagingDto, Model model) throws Exception {
		int list_count = sghTheaterService.getTheaterListCount(sghPagingDto);
		System.out.println("count:" + list_count);
		
		sghPagingDto.setTotal_count(list_count);
		sghPagingDto.setPageInfo();
		
		List<SghTheaterVo> theater_list = sghTheaterService.getTheaterPagingList(sghPagingDto);
		List<SghAreaVo> area_list = sghAreaService.getAreaList();
		
		model.addAttribute("theater_list", theater_list);
		model.addAttribute("sghPagingDto", sghPagingDto);
		model.addAttribute("area_list", area_list);
		return "user/sgh/sgh_admin/sgh_movie_theater_list";
	}
	
	// 영화관 등록 폼 이동
	@RequestMapping(value="movieTheaterAdd", method=RequestMethod.GET)
	public String movieTheaterAddForm(Model model) throws Exception {
		List<SghAreaVo> areaList = sghAreaService.getAreaList();
		model.addAttribute("areaList", areaList);
		return "user/sgh/sgh_admin/sgh_movie_theater_add";
	}
	
	// 영화관 수정 폼 이동
	@RequestMapping(value="movieTheaterModify", method=RequestMethod.GET)
	public String movieTheaterModifyForm(String theater_code, Model model){
		try {
			SghTheaterVo sghTheaterVo = sghTheaterService.selectOneTheater(theater_code);
			List<SghAreaVo> areaList = sghAreaService.getAreaList();
			model.addAttribute("areaList", areaList);
			model.addAttribute("sghTheaterVo", sghTheaterVo);
			return "user/sgh/sgh_admin/sgh_movie_theater_modify";
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return "user/sgh/sgh_admin/sgh_movie_theater_modify";
	}
	
	// 영화관 수정 처리
	@RequestMapping(value="movieTheaterModifyRun", method=RequestMethod.GET)
	public String movieTheaterModifyRun(SghTheaterVo sghTheaterVo, RedirectAttributes rttr){
		boolean result = false;
		try {
			sghTheaterService.modifyTheater(sghTheaterVo);
			return "redirect:/sgh/admin/movieTheaterList";
		} catch (Exception e) {
			e.printStackTrace();
		}
		rttr.addFlashAttribute("result", result);
		return "user/sgh/sgh_admin/sgh_movie_theater_modify?theater_code=" + sghTheaterVo.getTheater_code();
	}
	
	// 영화관 등록 처리
	@RequestMapping(value="movieTheaterAddRun", method=RequestMethod.GET)
	public String movieTheaterAdd(SghTheaterVo sghTheaterVo, RedirectAttributes rttr){
		System.out.println("SghTheaterVo :" + sghTheaterVo);
		String result;
		try {
			sghTheaterService.movieTheaterAdd(sghTheaterVo);
			result = "true";
			rttr.addFlashAttribute("message", result);
			return "redirect:/sgh/admin/adminMainForm";
		} catch (Exception e) {
			e.printStackTrace();
		}
		result = "false";
		rttr.addFlashAttribute("message", result);
		return "redirect:/sgh/admin/adminMainForm";
	}
}
