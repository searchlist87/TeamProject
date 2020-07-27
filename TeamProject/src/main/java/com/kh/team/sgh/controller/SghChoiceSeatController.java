package com.kh.team.sgh.controller;

import java.lang.ProcessBuilder.Redirect;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.team.domain.SghBookSeatVo;
import com.kh.team.domain.SghChoiceSeatDto;
import com.kh.team.domain.SghMovieMoneyVo;
import com.kh.team.domain.SghPaymentVo;
import com.kh.team.sgh.service.SghBookingService;

@Controller
@RequestMapping("/sgh/choiceSeat")
public class SghChoiceSeatController {
	// 예매에서 인원과 좌석을 선택할때 넘어가는 창
	
	@Inject
	private SghBookingService sghBookingService;
	
	// 인원 좌석 선택하는 폼
	@RequestMapping(value="/movie_time_seat", method=RequestMethod.GET)
	public String choiceSeatForm(SghPaymentVo sghPaymentVo, Model model, HttpSession session) throws Exception {
		System.out.println("찍힘?");
		String movie_time_code = sghPaymentVo.getMovie_time_code();
		List<SghBookSeatVo> book_seat_list = sghBookingService.getTimeSeat(movie_time_code);
		SghMovieMoneyVo movie_money_vo = sghBookingService.getMovieMoney(movie_time_code);
		
		// 결제를 위한 세션
		int money = movie_money_vo.getMovie_money();
		sghPaymentVo.setMovie_price(money);
		session.setAttribute("sghPaymentVo", sghPaymentVo);
		
		// 자바 스크립트로 보내기 위해서 JSON으로 변환
		JSONArray jArray = new JSONArray();
		for (SghBookSeatVo vo : book_seat_list) {
			String schedule_seat_code = vo.getSchedule_seat_code();
			movie_time_code = vo.getMovie_time_code();
			String movie_seat_num = vo.getMovie_seat_num();
			String seat_code = vo.getSeat_code();
			int screen_seat_row = vo.getScreen_seat_row();
			int screen_seat_col = vo.getScreen_seat_col();
			String seat_check = vo.getSeat_check();
			
			JSONObject jObject = new JSONObject();
			
			jObject.put("schedule_seat_code", schedule_seat_code);
			jObject.put("movie_time_code", movie_time_code);
			jObject.put("movie_seat_num", movie_seat_num);
			jObject.put("seat_code", seat_code);
			jObject.put("screen_seat_row", screen_seat_row);
			jObject.put("screen_seat_col", screen_seat_col);
			jObject.put("seat_check", seat_check);
			
			jArray.add(jObject);
		}
		
		model.addAttribute("jArray", jArray);
		model.addAttribute("movie_money_vo", movie_money_vo);
		return "user/sgh/sgh_book/sgh_choice_seat";
	}
	
	// 결제 폼으로
	@RequestMapping(value="/paymentForm", method=RequestMethod.GET)
	public String paymentForm(HttpSession session, Model model) throws Exception {
		SghChoiceSeatDto sghChoiceSeatDto = (SghChoiceSeatDto)session.getAttribute("sghChoiceSeatDto");
		model.addAttribute("sghChoiceSeatDto", sghChoiceSeatDto);
		System.out.println("payment-sghChoiceSeatDto : " + sghChoiceSeatDto);
		return "user/sgh/sgh_book/sgh_payment";
	}
	
	// 결제 폼으로
	@RequestMapping(value="/requestPayment", method=RequestMethod.POST)
	public String requestPayment(SghChoiceSeatDto sghChoiceSeatDto, HttpSession session, Model model) throws Exception {
		session.setAttribute("sghChoiceSeatDto", sghChoiceSeatDto);
		return "redirect:/sgh/choiceSeat/paymentForm";
	}
	
	// 결제 처리
	@RequestMapping(value="/paymentRun", method=RequestMethod.POST)
	public String paymentRun(String[] schedule_code_arr, HttpSession session, RedirectAttributes rttr) {
		SghPaymentVo sghPaymentVo = (SghPaymentVo)session.getAttribute("sghPaymentVo");
		try {
			String user_id = (String)session.getAttribute("user_id");
			sghPaymentVo.setUser_id(user_id);
			sghBookingService.updateScheduleSeat(sghPaymentVo, schedule_code_arr);
			session.removeAttribute("sghPaymentVo");
			session.removeAttribute("sghChoiceSeatDto");
			return "redirect:/sgh/choiceSeat/paymentResult";
		} catch(Exception e) {
			e.printStackTrace();
		}
		session.removeAttribute("sghPaymentVo");
		rttr.addFlashAttribute("result", "false");
		return "redirect:/sgh/choiceSeat/movie_time_seat?SghPaymentVo=" + sghPaymentVo;
	}
	
	// 결제 완료
	@RequestMapping(value="/paymentResult", method=RequestMethod.GET)
	public String paymentResult(RedirectAttributes rttr) throws Exception {
		rttr.addFlashAttribute("movie_payment_result", "true");
		return "redirect:/team/main";
	}
}
