package com.kh.team.sgh.controller;

import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.team.domain.SghMovieProductVo;
import com.kh.team.domain.SghPagingDto;
import com.kh.team.domain.SghSeatCheckVo;
import com.kh.team.sgh.service.SghMovieProductService;
import com.kh.team.sgh.util.SghAsciiChangeUtil;

@Controller
@RequestMapping("/sgh/admin/scheduleProduct")
public class SghMovieProductController {
	
	@Inject
	private SghMovieProductService sghMovieProductService;
	
	// 기간이 지나지 않은 스케쥴 리스트 폼으로
	@RequestMapping(value="/scheduleProductList", method=RequestMethod.GET)
	public String movieProductList(SghPagingDto sghPagingDto, Model model) throws Exception {
		int total_count = sghMovieProductService.getMovieProductTotal();
		sghPagingDto.setTotal_count(total_count);
		sghPagingDto.setPageInfo();
		List<SghMovieProductVo> movie_product_vo = sghMovieProductService.getMovieProductList(sghPagingDto);
		model.addAttribute("movie_product_vo", movie_product_vo);
		model.addAttribute("sghPagingDto", sghPagingDto);
		return "user/sgh/sgh_admin/sgh_schedule_product/sgh_schedule_product_list";
	}
	
	// 기간이 지난 스케쥴 리스트 폼으로
	@RequestMapping(value="/outProductList", method=RequestMethod.GET)
	public String outProductList(SghPagingDto sghPagingDto, Model model) throws Exception {
		int total_count = sghMovieProductService.getOutProductTotal();
		sghPagingDto.setTotal_count(total_count);
		sghPagingDto.setPageInfo();
		List<SghMovieProductVo> movie_product_vo = sghMovieProductService.getOutProductList(sghPagingDto);
		model.addAttribute("movie_product_vo", movie_product_vo);
		model.addAttribute("sghPagingDto", sghPagingDto);
		return "user/sgh/sgh_admin/sgh_schedule_product/sgh_out_schedule_product_list";
	}
	
	// 스케쥴 등록 폼으로
	@RequestMapping(value="/scheduleProductRegist", method=RequestMethod.GET)
	public String scheduleSeatRegist() throws Exception {
		return "user/sgh/sgh_admin/sgh_schedule_product/sgh_schedule_product_regist";
	}
	
	
	// 스케쥴 확인(한개 들고오기)
	@RequestMapping(value="scheduleProductInfo", method=RequestMethod.GET)
	public String scheduleSeatRegist(String movie_time_code, Model model) throws Exception {
		SghMovieProductVo sghMovieProductVo = sghMovieProductService.getMovieProductInfo(movie_time_code);
		List<SghSeatCheckVo> seat_check_list = sghMovieProductService.getSeatCheck(movie_time_code);
		int seat_col = sghMovieProductVo.getScreen_seat_col();
		ArrayList<String> seat_col_Array = SghAsciiChangeUtil.row_make(seat_col);
		
		model.addAttribute("sghMovieProductVo", sghMovieProductVo);
		model.addAttribute("seat_check_list", seat_check_list);
		model.addAttribute("seat_col_Array", seat_col_Array);
		return "user/sgh/sgh_admin/sgh_schedule_product/sgh_schedule_product_info";
	}
	
	// each에 쓸 데이터 요청
	@ResponseBody
	@RequestMapping(value="/seatCheckAjax", method=RequestMethod.GET)
	public List<SghSeatCheckVo> seatCheckAjax(String movie_time_code) throws Exception {
		List<SghSeatCheckVo> seat_check_list = sghMovieProductService.getSeatCheck(movie_time_code);
		return seat_check_list;
	}
}
