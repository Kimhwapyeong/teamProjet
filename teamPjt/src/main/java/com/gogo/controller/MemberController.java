package com.gogo.controller;

import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

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
		MemberVO user = memberService.selectOne(member);
		
		if(member != null) {
			session.setAttribute("member", user);
			session.setAttribute("memberId", user.getMemberId());
			Map<String, Object> map = responseMap(REST_SUCCESS, "환영합니다.");
			
			// SNS 로그인 체크 로직		
			if("Y".equals(member.getSnsCk())) {
				map.put("msg", "네이버 로그인 성공!");
			}
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
	// 회원가입 페이지 이동
	@GetMapping("/login/signup")
	public String signup(HttpSession session) {
		// 세션에 "category"라는 이름으로 "signup"을 저장 
		session.setAttribute("category", "signup");
		return "/login/signup";
	}
	
	//아이디 중복확인 요청
	@PostMapping("/idCheck")
	public @ResponseBody Map<String, Object> idCheck(@RequestBody MemberVO member){
		
		int res = memberService.idCheck(member);
		
		if(res == 0) {
			// count = 1이면 fail(회원가입 불가)
			return responseMap(REST_SUCCESS,"사용가능한 아이디 입니다.");
		}else {
			return responseMap(REST_FAIL,"이미 사용중인 아이디 입니다.");	
		}
	}
	
	
	//네이버 로그인
	@GetMapping("naverAction")
	public String naverAction() {
		return "/login/naverAction";
	}
	
	@PostMapping("naverSave")
	@Transactional
	public @ResponseBody Map<String, Object> naverSave(MemberVO member
										, HttpSession session
										, Model model
										, RedirectAttributes rttr) {
		
		Map<String, Object> result = new HashMap<String, Object>();
		
	    System.out.println("#############################################");
	    System.out.println(member.getMemberId());
	    System.out.println(member.getMemberName());
	    System.out.println(member.getBirthday());
	    System.out.println(member.getProfile());
	    System.out.println(member.getGender());
	    System.out.println(member.getMemberEmail());
	    System.out.println(member.getSnsCk());
	    System.out.println("#############################################");
	    
	    // 네이버는 정확한 연령 데이터를 주지 않는다
	    // 네이버 로그인은 모두 0000년생으로 설정
	    String birthday = member.getBirthday();
	    String month = birthday.substring(0, 2);
	    String days = birthday.substring(3);
	    member.setBirthday("00"+month+days);
	    
	    
	    int idCheck = memberService.idCheck(member);
	    if(idCheck==0) {
	    	
	    	// 네이버 회원가입의 경우 비밀번호 랜덤
	    	String naverPW = UUID.randomUUID().toString();
	    	member.setPw(naverPW);

	    	int res = memberService.signup(member);
	    	
	    	if(res>0) {
	    		memberService.updateNaver(member);
	    		result.put("msg", "네이버 회원가입 성공");
	    		loginAction(member, model, session);
	    	} else {
	    		result.put("msg", "네이버 회원가입 실패");
	    		
	    	}
	    	
	    } else {
	    	// 이미 회원가입 되어 있는 네이버 로그인의 경우 비밀번호를 가져와 세팅
	    	String naverPW = memberService.getPw(member);
	    	member.setPw(naverPW);
	    	Map<String, Object> map = loginAction(member, model, session);	
	    	if("success".equals(map.get("result"))) {
	    		result.put("result", "ok");
	    	} else {
	    		result.put("result", "ok");
	    	}
	    }
	    
	    return result;
	     

	}

}

