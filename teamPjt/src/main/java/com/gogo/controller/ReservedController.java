package com.gogo.controller;

import java.text.DecimalFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.gogo.service.ReservedService;
import com.gogo.vo.ReservedVO;
import com.gogo.vo.RoomVO;
import com.gogo.vo.StayVO;

@Controller
@RequestMapping("/reserved/*")
public class ReservedController {
	
	@Autowired
	ReservedService service;
	
	
	@GetMapping("reserved")
	public void reservation(ReservedVO reserved, Model model) {
		
		// 받아올 데이터가 없기에 일단은 매개변수에서 빼서 여기에 세팅
		//ReservedVO reserved = new ReservedVO();
		
		// 테스트를 위해 임의로 정보 삽입
		reserved.setRoomNo("1");
		reserved.setMemberId("user1");
		reserved.setCheckIn("2023/08/06");
		reserved.setCheckOut("2023/08/09");
		reserved.setMemberCount("5");
		
		// 방 번호
		RoomVO room = service.selectOne_room(reserved.getRoomNo());
		StayVO stay = service.selectOne_stay(room.getStayNo());
		
		// 총 예약일 계산
		String reservedDay = service.reservedDay2(reserved.getCheckIn(), reserved.getCheckOut());
		
		// 3자리 콤마
		// DecimalFormat은 Number형만 받음
		int price = Integer.parseInt(room.getPrice());
		
		DecimalFormat formatter = new DecimalFormat("###,###");
		room.setPrice(String.valueOf(formatter.format(price)));
		
		//System.out.println("reserved.reservationNo : "+ reserved.getReservationNo());
		System.out.println("reserved.roomNo : "+reserved.getRoomNo());
		System.out.println("reserved.memberid : "+reserved.getMemberId());
		//System.out.println("reserved.regDate : "+reserved.getRegDate());
		System.out.println("reserved.checkIn : "+reserved.getCheckIn());
		System.out.println("reserved.checkOut : "+reserved.getCheckOut());
		System.out.println("reserved.memberCount : "+reserved.getMemberCount());
		
		model.addAttribute("reserved", reserved);
		model.addAttribute("room", room);
		model.addAttribute("stay", stay);
		model.addAttribute("reservedDay", reservedDay);
		model.addAttribute("price", price);
	}
	
	@GetMapping("calendar")
	public void calender() {
		
	}
	
	@GetMapping("day")
	public String day(@RequestParam("reserved_day") String reserved_day
					, @RequestParam("reserved_checkIn") String reserved_checkIn
					, @RequestParam("reserved_checkOut") String reserved_checkOut
					, Model model) {
		
		System.out.println("총 예약일 : "+reserved_day);
		System.out.println("체크인 : "+reserved_checkIn);
		System.out.println("체크아웃 : "+reserved_checkOut);
		
		model.addAttribute("reserved_day", reserved_day);
		model.addAttribute("reserved_checkIn", reserved_checkIn);
		model.addAttribute("reserved_checkOut", reserved_checkOut);
		
		return "/reserved/reserved";
	}
}
