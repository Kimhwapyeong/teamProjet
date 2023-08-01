package com.gogo.controller;



import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;


import com.gogo.service.ReservedService;
import com.gogo.service.mypageService;


@Controller
@RequestMapping("/member/mypage/*")
public class UserController {
	
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
	public void infoFrm() {
		int res;
		
		System.out.println("출력: ");
		String msg = "";
	
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
