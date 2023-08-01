package com.gogo.controller;



import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.gogo.service.ReservedService;
import com.gogo.service.mypageService;
import com.gogo.vo.MemberVO;

import lombok.extern.log4j.Log4j;

@Log4j
@Controller
@RequestMapping("/member/mypage/*")
public class UserController extends CommonRestController{
	
	@Autowired
	mypageService service;
	
	@Autowired
	ReservedService service_r;
	
	
	// 예약 정보
	@GetMapping("reservation")
	public void reservation(Model model) {
		service.reservList(model);
	}
	
	// 취소 내역
	@GetMapping("cancel")
	public void cancel(Model model) {
		service.cancelList(model);
	}
	
	// 관심 스테이
	@GetMapping("likestay")
	public void likestay() {
		
	}
	
	// 회원 정보 조회
	@GetMapping("info")
	public void info(Model model) {
		service.mem(model);
	}
	
	@PostMapping("infoFrm")
	public @ResponseBody Map<String, Object> infoFrm(@RequestBody MemberVO member) {
		try {
			int res = service.update(member);
			return responseMap(res, "회원 정보를 수정하였습니다");
		} catch (Exception e) {
			e.printStackTrace();
			return responseMap(REST_FAIL, "회원 정보 수정 중 문제가 발생하였습니다");
		}
	}
		
	// 메세지
	@GetMapping("message")
	public void message() {
		
	}
	
	// 예약 상세 확인
	@GetMapping("reserved_detail")
	public void reserved_detail(@RequestParam("checkIn") String checkIn
								, @RequestParam("checkOut") String checkOut
								, @RequestParam("price") String price
								, @RequestParam("stayNo") String stayNo
								, @RequestParam("reservationNo") String reservationNo
								, Model model) {
		
		service.reservation_detail(checkIn, checkOut, price, stayNo, reservationNo, model);
		
	}

	
}
