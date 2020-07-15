package com.kh.team.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.kh.team.domain.SghAreaVo;
import com.kh.team.domain.SghTheaterVo;
import com.kh.team.service.SghAreaService;
import com.kh.team.service.SghTheaterService;

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
	public String movieTheaterListForm() throws Exception {
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
	public String movieTheaterModifyForm() throws Exception {
		return "user/sgh/sgh_admin/sgh_movie_theater_modify";
	}
	
	// 영화관 등록 처리
	@RequestMapping(value="movieTheaterAddRun", method=RequestMethod.GET)
	public String movieTheaterAdd(SghTheaterVo sghTheaterVo){
		System.out.println("SghTheaterVo :" + sghTheaterVo);
		try {
			sghTheaterService.movieTheaterAdd(sghTheaterVo);
			
		} catch (Exception e) {
		
		}
		return null;
	}
}
