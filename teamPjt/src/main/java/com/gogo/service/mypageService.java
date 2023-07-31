package com.gogo.service;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.gogo.vo.MemberVO;
import com.gogo.vo.QuestionVO;
import com.gogo.vo.ReservedVO;
import com.gogo.vo.StayVO;

import lombok.extern.log4j.Log4j;

@Service
public interface mypageService {

	// ▶▶▶  admin ▶▶▶
	// 숙소 조회
	public List<StayVO> getList(Model model);
	
	// 회원 조회
	public List<MemberVO> getMember(Model model);
	
	
	// ▶▶▶  host ▶▶▶
	// 숙소 관리
	public List<StayVO> getStay(Model model);
	
	// 예약 관리
	public List<ReservedVO>reservinfo(Model model);
	
	// 예약 관리 대표 사진
	public List<Map<String, String>> reservpic(Model model);
	
	// 가이드 문의 요청 ->
	public int insert(QuestionVO qa);
	
	// 문의 내역 조회
	public List<QuestionVO> qaList(Model model);
	
	// 문의 내역 한건 조회
	public QuestionVO getOne(int queNo);
	
	
	// ▶▶▶  host ▶▶▶
	// 회원 정보 조회
	public List<MemberVO> mem(Model model);
		
}
