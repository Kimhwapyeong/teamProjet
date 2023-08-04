package com.gogo.service;

import org.springframework.stereotype.Service;
import com.gogo.vo.MemberVO;

@Service
public interface MemberService {

	public MemberVO login(MemberVO member);
	
	
	public MemberVO selectOne(MemberVO member);
	
	// 네이버를 위한 로직
	public int updateNaver(MemberVO member);
	public String getPw(MemberVO member);

	public int idCheck(MemberVO member);

	public int signup(MemberVO member);
	

}
