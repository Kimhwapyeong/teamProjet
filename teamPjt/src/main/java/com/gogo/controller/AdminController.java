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
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

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
	
	
//	// 사용자 삭제
//	@GetMapping("delete")
//	public String delete(String memberId, Model model, RedirectAttributes rttr) {
//		System.out.println("memberId:" + memberId);
//		int res = mypageService.delete(memberId);
//		System.out.println("삭제 res : " + res);
//		
//		String msg = "";
//		
//		if(res>0) {
//			msg = memberId + "회원을 삭제하였습니다";
//			rttr.addFlashAttribute("msg", msg);  
//			return "redirect:/member/admin/useradmin";
//		} else {
//			msg = "회원 삭제 도중 오류가 발생하였습니다";
//			model.addAttribute("msg", msg);
//			return "redirect:/member/admin/useradmin";
//		}
//	}
	// 사용자 삭제
	@GetMapping("delete")
	public String delete(String memberId, Model model, RedirectAttributes rttr) {
		System.out.println("memberId:" + memberId);
		String[] idArr = memberId.split(",");
		System.out.println("idArr : " + idArr);
		
		int res = mypageService.deleteArr(idArr);
		System.out.println("삭제 res : " + res);
		
		String msg = "";
		
		if(res>0) {
			msg = memberId + "회원을 삭제하였습니다";
			rttr.addFlashAttribute("msg", msg);  
			return "redirect:/member/admin/useradmin";
		} else {
			msg = "회원 삭제 도중 오류가 발생하였습니다";
			model.addAttribute("msg", msg);
			return "redirect:/member/admin/useradmin";
		}
	}
	
	
	// 호스트 지원
	@GetMapping("hosthelp")
	public void hosthelp() {
		
	}
	
	// 통계 및 지원
	@GetMapping("statistics")
	public void statistics() {
		
	}
	
	
	@RequestMapping("statistics")
	public @ResponseBody List<MemberVO> statistics(Model model, MemberVO vo){
		List<MemberVO> list = mypageService.chartAge(vo);
	    model.addAttribute("mb_id", list);
	    log.info("============");
	    log.info("mb_id : " + list);
	    return list;
	}



}
