package com.gogo.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.gogo.mapper.mypageMapper;
import com.gogo.vo.MemberVO;
import com.gogo.vo.StayVO;

import lombok.extern.log4j.Log4j;

@Log4j
@Service
public class mypageServiceImpl implements mypageService {
	
	@Autowired
	mypageMapper mypageMapper;
	
	// ▶▶▶  admin ▶▶▶
	// 숙소 조회
	@Override
		public List<StayVO> getList(Model model) {
			List<StayVO> list = mypageMapper.getList();
			log.info("===========");
			log.info("list : " + list);
			model.addAttribute("list", list);
			return null;
			
		}
	
	// 회원 조회
	@Override
	public List<MemberVO> getMember(Model model) {
		List<MemberVO> member = mypageMapper.getMember();
		log.info("===========");
		log.info("member : " + member);
		model.addAttribute("member", member);
		return null;
	}
	
	// ▶▶▶  admin ▶▶▶
	// 숙소 관리
	@Override
	public List<StayVO> getStay(Model model) {
		List<StayVO> list = mypageMapper.getStay();
		log.info("===========");
		log.info("list : " + list);
		model.addAttribute("list", list);
		return null;
	}
}
