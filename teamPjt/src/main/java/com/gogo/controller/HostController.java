package com.gogo.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.gogo.service.mypageService;

@Controller
@RequestMapping("/member/host/*")
public class HostController {
	
	@Autowired
	mypageService mypageService;
	
	// 숙소 관리
	@GetMapping("stayhost")
	public void stayhost(Model model) {
		mypageService.getStay(model);
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
