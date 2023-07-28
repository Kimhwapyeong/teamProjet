package com.gogo.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.gogo.vo.MemberVO;
import com.gogo.vo.StayVO;

import lombok.extern.log4j.Log4j;

@Service
public interface mypageService {

	// ▶▶▶  admin ▶▶▶
	// 숙소 조회
	public List<StayVO> getList(Model model);
	
	// 회원 조회
	public List<MemberVO> getMember(Model model);
	
	// 연령대별 조회
	public List<MemberVO> getMemberAgeGroups();
}
