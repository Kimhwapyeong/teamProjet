package com.gogo.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.gogo.service.mypageService;

@Controller
@RequestMapping("/member/mypage/*")
public class UserController {
	
	@Autowired
	mypageService service;
	
	// 예약 정보
	@GetMapping("reservation")
	public void reservation(Model model) {
		service.reservList(model);
	}
	
	// 취소내역
	@GetMapping("cancel")
	public void cancel(Model model) {
		service.cancelList(model);
	}
	
	// 관심 스테이
	@GetMapping("likestay")
	public void likestay() {
		
	}
	
	// 회원 정보 수정
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
	
}
