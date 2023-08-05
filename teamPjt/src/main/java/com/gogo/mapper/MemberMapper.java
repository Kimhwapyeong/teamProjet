package com.gogo.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import com.gogo.vo.MemberVO;


public interface MemberMapper {
	
	public MemberVO login(MemberVO member);
	
	// 멤버의 정보를 불러오기 위한 함수
	public MemberVO selectOne(MemberVO member);
	
	public int updateNaver(MemberVO member);
	
	public String getPw(MemberVO member);
	
	public List<String> getMemberRole(String memberId);

	public int signupAction(MemberVO member);

	public int idCheck(MemberVO member);

	@Select("SELECT NVL(memberId, 0) FROM member WHERE memberName=#{memberName} AND memberEmail=#{memberEmail}")
	public String findIdAction(@Param("memberName") String memberName, @Param("memberEmail") String memberEmail);
}
