package com.gogo.service;

import java.text.DecimalFormat;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.gogo.mapper.ReservedMapper;
import com.gogo.vo.ReservedVO;
import com.gogo.vo.RoomVO;
import com.gogo.vo.StayVO;

@Service
public class ReservedServiceImpl implements ReservedService{
	
	@Autowired
	ReservedMapper reservedMapper;
	
	@Autowired
	PaymentService service_p;
	
	@Override
	public int insertReserved(ReservedVO vo) {
		
		return reservedMapper.insertReserved(vo);
	}


	@Override
	public RoomVO selectOne_room(String roomNo) {
		return reservedMapper.selectOne_room(roomNo);
	}


	@Override
	public StayVO selectOne_stay(String stayNo) {
		return reservedMapper.selectOne_stay(stayNo);
	}


	@Override
	public String reservedDay(String reservationNo) {
		return reservedMapper.reservedDay(reservationNo);
	}


	@Override
	public String reservedDay2(String checkIn, String checkOut) {
		return reservedMapper.reservedDay2(checkIn, checkOut);
	}


	@Override
	public String getReservationNo() {
		return reservedMapper.getReservationNo();
	}
	
	// 예약 페이지에 세팅할 데이터를 model에 담는 메소드
	@Override
	public String goReserved(ReservedVO reserved, Model model) {
		
		
		// 메인 페이지에서 날짜 선택할 경우 모든 데이터 null 이기에 검색 페이지로 이동
		if(reserved.getRoomNo()==null||"".equals(reserved.getRoomNo())) {
			
			return "/stay/list";
			
		}
		
		
		
		// 방 번호
		RoomVO room = selectOne_room(reserved.getRoomNo());
		StayVO stay = selectOne_stay(room.getStayNo());
		
		
		
		// 총 예약일 계산
		int reservedDay = Integer.parseInt(reservedDay2(reserved.getCheckIn(), reserved.getCheckOut()));
		
		// 3자리 콤마
		// DecimalFormat은 Number형만 받음
		
		int price = Integer.parseInt(room.getPrice());
		
		if(reservedDay!=0) {
			price = price * reservedDay;
		}
		
		
		
		DecimalFormat formatter = new DecimalFormat("###,###");
		room.setPrice(String.valueOf(formatter.format(price)));
		
		
		// merchant_uid(거래 번호)를 새로 생성
		String merchant_uid = service_p.getUid();
		
		String reservationNo = getReservationNo();
		
		System.out.println("reservationNo : "+ reservationNo);
		System.out.println("reserved.roomNo : "+reserved.getRoomNo());
		System.out.println("reserved.memberid : "+reserved.getMemberId());
		//System.out.println("reserved.regDate : "+reserved.getRegDate());
		System.out.println("reserved.checkIn : "+reserved.getCheckIn());
		System.out.println("reserved.checkOut : "+reserved.getCheckOut());
		System.out.println("reserved.memberCount : "+reserved.getMemberCount());
		System.out.println("reserved.merchant_uid : "+ merchant_uid);
		
		model.addAttribute("reserved", reserved);
		model.addAttribute("room", room);
		model.addAttribute("stay", stay);
		model.addAttribute("reservedDay", reservedDay);
		model.addAttribute("price", price);
		model.addAttribute("merchant_uid", merchant_uid);
		model.addAttribute("reservationNo", reservationNo);

		return "/reserved/reserved";
		
	}
	
		
}
