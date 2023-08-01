package com.gogo.service;

import org.springframework.stereotype.Service;
import com.gogo.vo.MemberVO;

@Service
public interface MemberService {

	MemberVO login(MemberVO member);

	int idCheck(MemberVO member);

	int signup(MemberVO member);
	

}
