package com.gogo.service;

import org.springframework.stereotype.Service;
import com.gogo.vo.MemberVO;

@Service
public interface MemberService {

	// 로그인
	public MemberVO login(MemberVO member);
	
	// 회원 정보 조회 
	public MemberVO selectOne(MemberVO member);
	
	// 네이버를 위한 로직
	public int updateNaver(MemberVO member);
	public String getPw(MemberVO member);

	// 아이디 중복 체크
	public int idCheck(MemberVO member);

	// 회원가입
	public int signupAction(MemberVO member);

	// 아이디 찾기 
	public String findIdAction(MemberVO member);

	

}
