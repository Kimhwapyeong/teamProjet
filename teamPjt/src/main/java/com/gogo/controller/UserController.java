package com.gogo.controller;



import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

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
	@GetMapping(value = {"reservation", "travelCnt"})
	public void reservation(Model model, HttpServletRequest request) {
		
		
		HttpSession session = request.getSession();
		String memberId = (String)session.getAttribute("memberId");
		service.reservList(model, memberId);
		int res = service.travelCnt(memberId);
		model.addAttribute("travelCnt", res);
		
	}
	
	// 취소 내역
	@GetMapping(value = {"cancel", "travelCnt"})
	public void cancel(Model model, HttpServletRequest request) {
		
		HttpSession session = request.getSession();
		String memberId = (String)session.getAttribute("memberId");
		service.cancelList(model, memberId);
		int res = service.travelCnt(memberId);
		model.addAttribute("travelCnt", res);
	}
	
	// 관심 스테이
	@GetMapping(value = {"likestay", "travelCnt"})
	public void likestay(Model model, HttpServletRequest request) {
		service.likestay(model);
		
		HttpSession session = request.getSession();
		String memberId = (String)session.getAttribute("memberId");
		int res = service.travelCnt(memberId);
		model.addAttribute("travelCnt", res);
	}
	
	// 회원 정보 조회
	@GetMapping(value = {"info", "travelCnt"})
	public void info(Model model, HttpServletRequest request) {
		service.mem(model);

		HttpSession session = request.getSession();
		String memberId = (String)session.getAttribute("memberId");
		int res = service.travelCnt(memberId);
		model.addAttribute("travelCnt", res);
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
	
	// 회원 탈퇴
	@PostMapping("memberQuit")
	public String memberQuit(String memberId, RedirectAttributes rttr) {
		
		int res;
		
		String msg = "";
		res = service.memberQuit(memberId);
		
		if(res > 0) {
			msg="회원 탈퇴 되었습니다";
			rttr.addFlashAttribute("msg", msg);  
			return "redirect:/member/mypage/info";
		} else {
			msg="회원 탈퇴 중 오류가 발생하였습니다";
			rttr.addFlashAttribute("msg", msg);  
			return "redirect:/member/mypage/info";
		}
		
		
		
	}
		
	// 메세지 연결
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
								, Model model, HttpServletRequest request) {
		
		service.reservation_detail(checkIn, checkOut, price, stayNo, reservationNo, model);
		
		
		HttpSession session = request.getSession();
		String memberId = (String)session.getAttribute("memberId");
		int res = service.travelCnt(memberId);
		model.addAttribute("travelCnt", res);
		
	}
	
	
}
