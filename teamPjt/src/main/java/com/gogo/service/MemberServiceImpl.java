package com.gogo.service;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.gogo.mapper.MemberMapper;
import com.gogo.vo.MemberVO;

@Service
public class MemberServiceImpl implements MemberService {

	@Autowired
	MemberMapper memberMapper;

	@Autowired
	BCryptPasswordEncoder encoder;
	
	@Override
	public MemberVO login(MemberVO paramMember) {
		// 사용자 정보 조회
		MemberVO member = memberMapper.login(paramMember);
		
		if(member != null) {
			// 사용자가 입력한 비밀번호가 일치하는지 확인
			// 사용자가 입력한 비밀번호, 데이터베이스에 암호화되어 저장된 비밀번호
			boolean res = 
					encoder.matches(paramMember.getPw(), member.getPw());
			
			// 비밀번호 인증이 성공하면 member객체를 반환
			if(res) {
				// 사용자 권한을 조회
				member.setRole(memberMapper.getMemberRole(member.getMemberId()));
				
				return member;
			}
			
		}
		
		return member;
	}
	@Override
	public int signup(MemberVO member) {
		
		// 비밀번호 암호화
		BCryptPasswordEncoder encoder =  new BCryptPasswordEncoder();
		
		// 암호화된 비번을 다시 비번에 넣어줌
		member.setPw(encoder.encode(member.getPw()));
		
		System.out.println("pw : "+ member.getPw());
		return memberMapper.signup(member);
	}

	@Override
	public int idCheck(MemberVO member) {
		return memberMapper.idCheck(member);
	}


	
}

















