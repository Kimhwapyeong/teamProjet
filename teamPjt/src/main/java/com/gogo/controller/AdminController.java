package com.gogo.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.gogo.service.mypageService;
import com.gogo.vo.MemberVO;
import com.google.gson.Gson;

import lombok.extern.log4j.Log4j;

@Log4j
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
	public void useradmin(Model model) {
		mypageService.getMember(model);
	}
	
	// 호스트 지원
	@GetMapping("hosthelp")
	public void hosthelp() {
		
	}
	
//	// 통계 및 지원
//	@GetMapping("statistics")
//	public void statistics() {
//		
//	}
	
	@RequestMapping("statistics")
	public @ResponseBody List<MemberVO> statistics(Model model, MemberVO vo){
		List<MemberVO> list = mypageService.chartAge(vo);
	    model.addAttribute("mb_id", list);
	    log.info("============");
	    log.info("mb_id : " + list);
	    return list;
	}



}
