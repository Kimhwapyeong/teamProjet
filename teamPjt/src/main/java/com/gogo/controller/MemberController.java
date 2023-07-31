package com.gogo.controller;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;

import com.gogo.service.MemberService;
import com.gogo.vo.MemberVO;

@Controller
public class MemberController extends CommonRestController {

    @Autowired
    private MemberService memberService;

    // 로그인 페이지 이동
	@GetMapping("/login/login")
	public String login() {
		return "/login/login";
	}
	
	// 로그아웃 페이지 이동
	@GetMapping("/logout")
	public String logout(HttpSession session) {
		// 현재 세션 무효화하여 로그아웃처리
		session.invalidate();
		return "/login/login";
	}
	
	//JSON 형식 데이터 교환
	@PostMapping("/login/loginAction")
	public @ResponseBody Map<String, Object> loginAction(
										@RequestBody MemberVO member
										, Model model
										, HttpSession session) {
		System.out.println("id : " + member.getMemberId());
		System.out.println("pw : " + member.getPw());
		
		member = memberService.login(member);
		System.out.println(member.getMemberId());
		if(member != null) {
			session.setAttribute("member", member);
			session.setAttribute("memberId", member.getMemberId());
			Map<String, Object> map = responseMap(REST_SUCCESS, "환영합니다.");
			
			// 권한 확인
			if(member.getRole() != null && member.getRole().contains("ADMIN_ROLE")) {
				// 관리자 로그인 -> 관리자 페이지로 이동
				map.put("url", "/admin/stayadmin");
			} else if(member.getRole() != null && member.getRole().contains("HOST_ROLE")){
				map.put("url", "host/stayhost");
			} else {
				map.put("url", "/main");
			}
			
			return map;
			
		} else {
			return responseMap(REST_FAIL, "아이디와 비밀번호를 확인해주세요.");
		}
		
	}
	

	@GetMapping("/login/signup")
	public String signup() {
		return "/login/signup";
	}
}

