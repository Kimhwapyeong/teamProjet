package com.gogo.service;

import org.springframework.stereotype.Service;
import com.gogo.vo.MemberVO;

@Service
public interface MemberService {

	public MemberVO login(MemberVO member);

	public int idCheck(MemberVO member);

	public int signup(MemberVO member);
	

}
