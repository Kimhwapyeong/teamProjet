package com.gogo.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.gogo.service.mypageService;
 
@Controller
@RequestMapping("/member/admin/*")
public class AdminController {
	
	@Autowired
	mypageService mypageService;
	// 숙소 관리
	@GetMapping("stayadmin")
	public void stayadmin(Model model) {
		mypageService.getList(model);
	}
	
	// 사용자 관리
	@GetMapping("useradmin")
	public void useradmin() {
		
	}
	
	// 호스트 지원
	@GetMapping("hosthelp")
	public void hosthelp() {
		
	}
	
	// 통계 및 지원
	@GetMapping("statistics")
	public void statistics() {
		
	}

}
