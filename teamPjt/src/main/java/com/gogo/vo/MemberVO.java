package com.gogo.vo;

import java.util.List;

import lombok.Data;

@Data
public class MemberVO {

	private String memberId;
	private String pw;
	private String memberName;
	private String birthday; // 생년월일 19990101
	private String gender;
	private String memberEmail;
	private String registraionDate; // 가입일
	private String snsCk;	// 소셜계정 로그인 체크
	private String profile;
	
	// 사용자 권한
	private List<String> role;
	
}
