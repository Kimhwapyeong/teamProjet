package com.gogo.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.gogo.service.mypageService;
import com.gogo.vo.QuestionVO;

import lombok.extern.log4j.Log4j;

@Log4j
@Controller
@RequestMapping("/member/host/*")
public class HostController extends CommonRestController{
	
	@Autowired
	mypageService mypageService;
	
	// 숙소 관리
	@GetMapping("stayhost")
	public void stayhost(Model model) {
		mypageService.getStay(model);
	}
	
	// 예약 관리
	@GetMapping("reservation")
	public void reservation(Model model) {
		mypageService.reservinfo(model);
//		mypageService.reservpic(model);
	}
	
	// 수입 현황
	@GetMapping("income")
	public void income() {
		
	}
	
	// 호스트 가이드
	@GetMapping("guide")
	public void guide() {
		
	}
	
	// 호스트 가이드 -문의
	@PostMapping("write")
	public String insert(QuestionVO qa, Model model) {
		int res;
		
		String msg = "";
		res = mypageService.insert(qa);
		
		if(res > 0) {
			msg="문의 되었습니다";
			model.addAttribute("msg", msg);
			return "./qaList";
		} else {
			return "./guide";
		}
	}
	
	@GetMapping("qaList")
	public void qaList(Model model) {
		mypageService.qaList(model);
	}
	
}
