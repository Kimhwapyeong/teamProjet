package com.gogo.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/member/mypage/*")
public class MemberController {
	
	// 예약 정보
	@GetMapping("reservation")
	public void reservation() {
		
	}
	
	// 취소내역
	@GetMapping("cancel")
	public void cancel() {
		
	}
	
	// 관심 스테이
	@GetMapping("likestay")
	public void likestay() {
		
	}
	
	// 회원 정보 수정
	@GetMapping("info")
	public void info() {
		
	}
		
	// 메세지
	@GetMapping("message")
	public void message() {
		
	}
	
}
