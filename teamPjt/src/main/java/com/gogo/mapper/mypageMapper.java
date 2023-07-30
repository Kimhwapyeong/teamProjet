package com.gogo.mapper;

import java.util.List;

import com.gogo.vo.MemberVO;
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
	public List<StayVO> getStay();
	
	// 예약 관리
	public List<ReservedVO>reservinfo();
	
	// 예약 관리 대표 사진
//	public List<StayVO> reservpic();
	
}
