package com.gogo.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/member/host/*")
public class HostController {
	
	// 숙소 관리
	@GetMapping("stayhost")
	public void stayhost() {
		
	}
	
	// 예약 관리
	@GetMapping("reservation")
	public void reservation() {
		
	}
	
	// 수입 현황
	@GetMapping("income")
	public void income() {
		
	}
	
	// 호스트 가이드
	@GetMapping("guide")
	public void guide() {
		
	}
	
}
