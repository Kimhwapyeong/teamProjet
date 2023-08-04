package com.gogo.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestParam;

import com.gogo.mapper.mypageMapper;
import com.gogo.vo.AnswerVO;
import com.gogo.vo.MemberVO;
import com.gogo.vo.PaymentVO;
import com.gogo.vo.QuestionVO;
import com.gogo.vo.ReservedVO;
import com.gogo.vo.RoomVO;
import com.gogo.vo.StayVO;

import lombok.extern.log4j.Log4j;

@Log4j
@Service
public class mypageServiceImpl implements mypageService {
	
	@Autowired
	mypageMapper mypageMapper;
	
	@Autowired
	ReservedService service_r;
	
	@Autowired
	PaymentService service_p;
	
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
	
	
	@Override
	public int deleteStay(String[] idArr) {
		System.out.println(idArr[0]);
		HashMap<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("idArr", idArr);
		return mypageMapper.deleteStay(paramMap);
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
	public int deleteArr(String[] idArr) {
		System.out.println(idArr[0]);
		HashMap<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("idArr", idArr);
		return mypageMapper.deleteArr(paramMap);
	}
	
	
	@Override
	public int answering(AnswerVO vo) {
		return mypageMapper.answering(vo);
	}
	
	
	@Override
	public AnswerVO answerInfo(int queNo) {
		AnswerVO answer = mypageMapper.answerInfo(queNo);
		return answer;
	}
	
	
	@Override
	public List<MemberVO> chartAge(MemberVO vo) {
		List<MemberVO> member = mypageMapper.chartAge(vo);
		return member;
	}
	
	
	
	// ▶▶▶  host ▶▶▶
	// 숙소 관리
	@Override
	public List<StayVO> getStay(Model model) {
		List<StayVO> list = mypageMapper.getStay();
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
	public List<QuestionVO> qaList(Model model, QuestionVO vo) {
		List<QuestionVO> question = mypageMapper.qaList();
		
		int queNo = 0;
		
		for(QuestionVO que : question) {
			queNo = que.getQueNo();
			AnswerVO answer = answerInfo(queNo);
			
			if(answer != null) {
				que.setAnswerYN("Y");
			}
		}
		
		model.addAttribute("list", question);
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
			String day = service_r.reservedDay2(map.get("CHECKIN"), map.get("CHECKOUT"));
			int dayInteger = Integer.parseInt(day);
			int priceInteger = Integer.parseInt(String.valueOf(map.get("PRICE")));
			int res = dayInteger * priceInteger;
			
			map.put("amount", service_r.comma(res));
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
		
		list.forEach(map->{
			String day = service_r.reservedDay2(map.get("CHECKIN"), map.get("CHECKOUT"));
			int dayInteger = Integer.parseInt(day);
			int priceInteger = Integer.parseInt(String.valueOf(map.get("PRICE")));
			int res = dayInteger * priceInteger;
			
			map.put("amount", service_r.comma(res));
		});

		
		
		log.info("===========");
		log.info("list : " + list);
		model.addAttribute("list", list);
		return null;
	}
	
	
	// 회원정보 조회
	@Override
	public List<MemberVO> mem(Model model) {
		List<MemberVO> mem = mypageMapper.mem();
		log.info("===========");
		log.info("mem : " + mem);
		model.addAttribute("mem", mem);
		
		return null;
	}
	
	
	// 회원 정보 수정
	@Override
	public int update(MemberVO vo) {
		return mypageMapper.update(vo);
		
	}
	
	
	// 회원 탈퇴
	@Override
	public int memberQuit(String memberId) {
		return mypageMapper.memberQuit(memberId);
	}
	
	
	// 예약 상세보기
	@Override
	public void reservation_detail(@RequestParam("checkIn") String checkIn
									, @RequestParam("checkOut") String checkOut
									, @RequestParam("price") String price
									, @RequestParam("stayNo") String stayNo
									, @RequestParam("reservationNo") String reservationNo
									, Model model) {
		// 총 몇 일인지 반환
		String day = service_r.reservedDay2(checkIn, checkOut);
		// 가격에 세자리 콤마를 찍어서 반환
		String dayPrice = service_r.comma(price);
		int a = Integer.parseInt(day);
		int b = Integer.parseInt(price);
		String allPrice = service_r.comma(a*b);
		int allPriceInteger = a*b;
		
		
		// stay 정보
		StayVO stay = service_r.selectOne_stay(stayNo);
		// reservation 정보
		ReservedVO reserved = service_r.selectOne_reservation(reservationNo);
		// room 정보
		RoomVO room = service_r.selectOne_room(reserved.getRoomNo());
		// payment 정보
		PaymentVO payment = service_p.selectOne_payment_reservationNo(reserved.getReservationNo());
		
		
		model.addAttribute("talk", reserved.getTalk());
		model.addAttribute("impUid", payment.getImpUid());
		model.addAttribute("stayAddress", stay.getStayAdress());
		model.addAttribute("allPrice", allPrice);
		model.addAttribute("allPriceInteger", allPriceInteger);
		model.addAttribute("dayPrice", dayPrice);
		model.addAttribute("day", day);
		model.addAttribute("roomName", room.getRoomName());
		model.addAttribute("checkIn", reserved.getCheckIn());
		model.addAttribute("checkOut", reserved.getCheckOut());
		model.addAttribute("paymentMethod", payment.getPaymentMethod());
		model.addAttribute("paymentRegDate", payment.getRegDate());

	}
	
	
	// 관심스테이
	@Override
	public List<Map<String, String>> likestay(Model model) {
		List<Map<String, String>> like = mypageMapper.likestay();
		log.info("===========");
		log.info("like : " + like);
		model.addAttribute("like", like);
		return null;
	}
	
	
	@Override
	public int travelCnt(String memberId) {
		//log.info("memberId : " + memberId);
		return mypageMapper.travelCnt(memberId);
	}

	
	
}
