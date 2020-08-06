package com.kh.team.sgh.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.team.domain.SghAdminMovieBuyVo;
import com.kh.team.domain.SghAreaVo;
import com.kh.team.domain.SghBuyCodeDto;
import com.kh.team.domain.SghBuyMovieVo;
import com.kh.team.domain.SghBuyTheaterVo;
import com.kh.team.domain.SghPagingDto;
import com.kh.team.domain.SghTheaterVo;
import com.kh.team.sgh.service.SghAdminMovieBuyService;
import com.kh.team.sgh.service.SghAreaService;
import com.kh.team.sgh.service.SghTheaterService;

@Controller
@RequestMapping("/sgh/admin")
public class SghAdminController {

	@Inject
	private SghAreaService sghAreaService;
	@Inject
	private SghTheaterService sghTheaterService;
	@Inject
	private SghAdminMovieBuyService sghAdminMovieBuyService;
	
	// 영화관 지역 폼 이동
	@RequestMapping(value="/areaListForm", method=RequestMethod.GET)
	public String areaListForm(SghPagingDto sghPagingDto, Model model) throws Exception {
		List<SghAreaVo> area_list = sghAreaService.getAreaList();
		model.addAttribute("area_list", area_list);
		return "user/sgh/sgh_admin/sgh_area/sgh_area_list";
	}
	
	// 삭제된 영화관 지역 폼 이동
	@RequestMapping(value="/deleteAreaListForm", method=RequestMethod.GET)
	public String deleteAreaListForm(SghPagingDto sghPagingDto, Model model) throws Exception {
		List<SghAreaVo> area_list = sghAreaService.getDeleteAreaList();
		model.addAttribute("area_list", area_list);
		return "user/sgh/sgh_admin/sgh_area/sgh_area_del_list";
	}
	
	// 영화관 지역 등록 폼 이동
	@RequestMapping(value="/areaAddForm", method=RequestMethod.GET)
	public String areaAddForm() throws Exception {
		return "user/sgh/sgh_admin/sgh_area/sgh_area_add";
	}
	
	// 영화관 삭제 처리
	@RequestMapping(value="/areaDeleteRun", method=RequestMethod.GET)
	public String areaDeleteRun(String area_code, RedirectAttributes rttr) {
		try {
			sghAreaService.delArea(area_code);
			return "redirect:/sgh/admin/areaListForm";
		} catch (Exception e) {
			e.printStackTrace();
		}
		String result = "false";
		rttr.addFlashAttribute("result", result);
		return "redirect:/sgh/admin/areaListForm";
	}
	
	// 영화관 복구 처리
	@RequestMapping(value="/areaRestore", method=RequestMethod.GET)
	public String areaRestore(String area_code, RedirectAttributes rttr) throws Exception {
		try {
			sghAreaService.restoreArea(area_code);
			return "redirect:/sgh/admin/deleteAreaListForm";
		} catch (Exception e) {
			e.printStackTrace();
		}
		String result = "false";
		rttr.addFlashAttribute("result", result);
		return "redirect:/sgh/admin/deleteAreaListForm";
	}
	
	// 영화관 등록 처리
	@RequestMapping(value="/areaAddRun", method=RequestMethod.GET)
	public String areaAddRun(String area_name, RedirectAttributes rttr){
		String result;
		try {
			sghAreaService.insertArea(area_name);
			return "redirect:/sgh/admin/areaListForm";
		} catch (Exception e) {
			e.printStackTrace();
		}
		result = "false";
		rttr.addFlashAttribute("message", result);
		return "redirect:/sgh/admin/areaListForm";
	}
	
	// 영화관 지역 등록 폼 이동
	@RequestMapping(value="/areaModfiyForm", method=RequestMethod.GET)
	public String areaModifyForm(String area_code, Model model) throws Exception {
		SghAreaVo areaVo = sghAreaService.getAreaInfo(area_code);
		model.addAttribute("areaVo", areaVo);
		return "user/sgh/sgh_admin/sgh_area/sgh_area_modify";
	}
	
	// 영화관 등록 처리
	@RequestMapping(value="/areaModifyRun", method=RequestMethod.GET)
	public String areaModfiyRun(String area_name, String area_code, RedirectAttributes rttr){
		try {
			sghAreaService.modifyArea(area_code, area_name);
			return "redirect:/sgh/admin/areaListForm";
		} catch (Exception e) {
			e.printStackTrace();
		}
		String result = "false";
		rttr.addFlashAttribute("message", result);
		return "redirect:/sgh/admin/areaListForm";
	}
	
	// 영화관 조회 폼 이동
	@RequestMapping(value="/movieTheaterList", method=RequestMethod.GET)
	public String movieTheaterListForm(SghPagingDto sghPagingDto, Model model) throws Exception {
		int list_count = sghTheaterService.getTheaterListCount(sghPagingDto);
		
		sghPagingDto.setTotal_count(list_count);
		sghPagingDto.setPageInfo();
		
		List<SghTheaterVo> theater_list = sghTheaterService.getTheaterPagingList(sghPagingDto);
		List<SghAreaVo> area_list = sghAreaService.getAreaList();
		
		model.addAttribute("theater_list", theater_list);
		model.addAttribute("sghPagingDto", sghPagingDto);
		model.addAttribute("area_list", area_list);
		return "user/sgh/sgh_admin/sgh_movie_theater_list";
	}
	
	// 삭제된 영화관 조회 폼 이동
	@RequestMapping(value="/deleteTheaterList", method=RequestMethod.GET)
	public String deleteTheaterForm(SghPagingDto sghPagingDto, Model model) throws Exception {
		int list_count = sghTheaterService.deleteTheaterListCount(sghPagingDto);
		
		sghPagingDto.setTotal_count(list_count);
		sghPagingDto.setPageInfo();
		
		List<SghTheaterVo> theater_list = sghTheaterService.deleteTheaterListPaging(sghPagingDto);
		List<SghAreaVo> area_list = sghAreaService.getAreaList();
		
		model.addAttribute("theater_list", theater_list);
		model.addAttribute("sghPagingDto", sghPagingDto);
		model.addAttribute("area_list", area_list);
		return "user/sgh/sgh_admin/sgh_delete_theater_list";
	}
	
	// 영화관 등록 폼 이동
	@RequestMapping(value="/movieTheaterAdd", method=RequestMethod.GET)
	public String movieTheaterAddForm(Model model) throws Exception {
		List<SghAreaVo> areaList = sghAreaService.getAreaList();
		model.addAttribute("areaList", areaList);
		return "user/sgh/sgh_admin/sgh_movie_theater_add";
	}
	
	// 영화관 등록 처리
	@RequestMapping(value="/movieTheaterAddRun", method=RequestMethod.GET)
	public String movieTheaterAdd(SghTheaterVo sghTheaterVo, RedirectAttributes rttr){
		String result;
		try {
			sghTheaterService.movieTheaterAdd(sghTheaterVo);
			return "redirect:/sgh/admin/movieTheaterList";
		} catch (Exception e) {
			e.printStackTrace();
		}
		result = "false";
		rttr.addFlashAttribute("message", result);
		return "redirect:/sgh/admin/movieTheaterList";
	}
	
	// 영화관 수정 폼 이동
	@RequestMapping(value="/movieTheaterModify", method=RequestMethod.GET)
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
		return "user/sgh/sgh_admin/movieTheaterList?theater_code=" + theater_code;
	}
	
	// 영화관 수정 처리
	@RequestMapping(value="/movieTheaterModifyRun", method=RequestMethod.GET)
	public String movieTheaterModifyRun(SghTheaterVo sghTheaterVo, RedirectAttributes rttr){
		boolean result = false;
		try {
			sghTheaterService.modifyTheater(sghTheaterVo);
			return "redirect:/sgh/admin/movieTheaterList";
		} catch (Exception e) {
			e.printStackTrace();
		}
		rttr.addFlashAttribute("result", result);
		return "redirect:/sgh/admin/movieTheaterList?theater_code=" + sghTheaterVo.getTheater_code();
	}
	
	// 영화관 삭제 처리
	@RequestMapping(value="/deleteTheater", method=RequestMethod.GET)
	public String stateDeleteTheater(String theater_code, RedirectAttributes rttr){
		try {
			sghTheaterService.stateDeleteTheater(theater_code);
			return "redirect:/sgh/admin/deleteTheaterList";
		} catch (Exception e) {
			e.printStackTrace();
		}
		rttr.addFlashAttribute("del_result", "false");
		return "redirect:/sgh/admin/deleteTheaterList";
	}
	
	// 영화관 복구 처리
	@RequestMapping(value="/restoreTheater", method=RequestMethod.GET)
	public String restoreTheater(String theater_code, RedirectAttributes rttr){
		try {
			sghTheaterService.restoreTheater(theater_code);
			return "redirect:/sgh/admin/movieTheaterList?theater_code=" + theater_code;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "redirect:/sgh/admin/movieTheaterList?theater_code=" + theater_code;
	}

	// 영화 내역 폼(페이징 검색기능 추가)
	@RequestMapping(value="/buyListForm", method=RequestMethod.GET)
	public String buyListForm(SghPagingDto sghPagingDto, Model model) throws Exception {
		// 페이징 + 검색한 목록 나오게 하기
		int total_count = sghAdminMovieBuyService.getTotalCount(sghPagingDto);
		sghPagingDto.setTotal_count(total_count);
		sghPagingDto.setPageInfo();
		List<SghAdminMovieBuyVo> sghAdminMovieBuyVoList = sghAdminMovieBuyService.getAdminMovieBuyList(sghPagingDto);
		
		// 영화관 목록
		List<SghAreaVo> area_list = sghAreaService.getAreaList();
		
		model.addAttribute("area_list", area_list);
		model.addAttribute("sghPagingDto", sghPagingDto);
		model.addAttribute("sghAdminMovieBuyVoList", sghAdminMovieBuyVoList);
		return "user/sgh/sgh_admin/sgh_movie_buy/sgh_movie_buy_list_form";
	}
	
	// 매출 내역의 지역 에이잭스 요청(영화관 목록 요청)
	@ResponseBody
	@RequestMapping(value="/areaAjax", method=RequestMethod.GET)
	public List<SghBuyTheaterVo> areaAjax(String area_code) throws Exception {
//		List<SghBuyTheaterVo> theater_list = sghAdminMovieBuyService.getBuyTheaterList(area_code);
		return sghAdminMovieBuyService.getBuyTheaterList(area_code);
	}
	
	// 매출 내역의 영화관 에이잭스 요청(영화 목록 요청)
	@ResponseBody
	@RequestMapping(value="/theaterAjax", method=RequestMethod.GET)
	public List<SghBuyMovieVo> theaterAjax(String theater_code) throws Exception {
		List<SghBuyMovieVo> movie_list = sghAdminMovieBuyService.getBuyMovieList(theater_code);
		return movie_list;
	}
	
	// 매출 내역 에이잭스 요청
	@ResponseBody
	@RequestMapping(value="/priceAjax", method=RequestMethod.GET)
	public int priceAjax(SghBuyCodeDto sghBuyCodeDto) throws Exception {
		int total_price = sghAdminMovieBuyService.getBuyTotal(sghBuyCodeDto);
		return total_price;
	}
}
