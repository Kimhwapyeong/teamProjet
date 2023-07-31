package com.gogo.mapper;

import java.util.List;

import com.gogo.vo.MemberVO;


public interface MemberMapper {
	
	public MemberVO login(MemberVO member);
	
	
	public List<String> getMemberRole(String memberId);


	public int signup(MemberVO member);
}
