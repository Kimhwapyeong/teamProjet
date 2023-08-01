package com.gogo.mapper;

import java.util.List;
import java.util.Map;

import com.gogo.vo.MemberVO;
import com.gogo.vo.QuestionVO;
import com.gogo.vo.ReservedVO;
import com.gogo.vo.StayVO;

public interface mypageMapper {
	
	// ▶▶▶  admin ▶▶▶
	// 숙소 조회
	public List<StayVO> getList();
	
	// 회원 조회
	public List<MemberVO> getMember();
	
	
	// ▶▶▶  host ▶▶▶
	// 숙소 관리
	public List<Map<String, String>> getStay();
	
	// 예약 관리
	public List<Map<String, String>> reservinfo();
	
	// 예약 관리 대표 사진
	public List<Map<String, String>> reservpic();
	
	// 가이드 질문
	public int insert(QuestionVO qa);
	
	// 문의 내역 조회
	public List<QuestionVO> qaList();
	
	// 문의 내역 한건 조회
	public QuestionVO getOne(int queNo);
	
	
	// ▶▶▶  user ▶▶▶
	// 예약 정보
	public List<Map<String, String>> reservList();
	
	// 취소 정보
	public List<Map<String, String>> cancelList();
	
	// 회원 정보 조회
	public List<MemberVO> mem();
	
	
}
