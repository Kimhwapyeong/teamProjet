package com.gogo.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.gogo.mapper.mypageMapper;
import com.gogo.vo.MemberVO;
import com.gogo.vo.QuestionVO;
import com.gogo.vo.ReservedVO;
import com.gogo.vo.StayVO;

import lombok.extern.log4j.Log4j;

@Log4j
@Service
public class mypageServiceImpl implements mypageService {
	
	@Autowired
	mypageMapper mypageMapper;
	
	@Autowired
	ReservedService service_r;
	
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
	
	
	@Override
	public List<MemberVO> chartAge() {
		List<MemberVO> member = mypageMapper.chartAge();
		return member;
	}
	
	
	// ▶▶▶  host ▶▶▶
	// 숙소 관리
	@Override
	public List<Map<String, String>> getStay(Model model) {
		List<Map<String, String>> list = mypageMapper.getStay();
		log.info("===========");
		log.info("list : " + list);
		model.addAttribute("list", list);
		return null;
	}
	
	@Override
	public List<Map<String, String>> reservinfo(Model model) {
		List<Map<String, String>> list = mypageMapper.reservinfo();
		log.info("===========");
		log.info("list : " + list);
		model.addAttribute("list", list);
		return null;
	}
	
	@Override
	public List<Map<String, String>> reservpic(Model model) {
		List<Map<String, String>> pic = mypageMapper.reservpic();
		log.info("===========");
		log.info("pic : " + pic);
		model.addAttribute("pic", pic);
		return null;
	}
	
	@Override
	public int insert(QuestionVO qa) {
		return mypageMapper.insert(qa);
	}
	
	@Override
	public List<QuestionVO> qaList(Model model) {
		List<QuestionVO> list = mypageMapper.qaList();
		model.addAttribute("list", list);
		return null;
	}
	
	@Override
	public QuestionVO getOne(int queNo) {
		QuestionVO que = mypageMapper.getOne(queNo);
		return que;
	}
	
	
	// ▶▶▶  user ▶▶▶
	// 예약 정보
	@Override
	public List<Map<String, String>> reservList(Model model) {
		List<Map<String, String>> list = mypageMapper.reservList();
		
		list.forEach(map->{
			
			map.put("amount", service_r.comma(map.get("price")));
			
		});
		
		log.info("===========");
		log.info("list : " + list);
		model.addAttribute("list", list);
		return null;
	}
	
	// 취소 정보
	@Override
	public List<Map<String, String>> cancelList(Model model) {
		List<Map<String, String>> list = mypageMapper.cancelList();
		log.info("===========");
		log.info("list : " + list);
		model.addAttribute("list", list);
		return null;
	}
	
	// 회원정보 수정
	@Override
	public List<MemberVO> mem(Model model) {
		List<MemberVO> mem = mypageMapper.mem();
		log.info("===========");
		log.info("mem : " + mem);
		model.addAttribute("mem", mem);
		
		return null;
	}
	
	
}
