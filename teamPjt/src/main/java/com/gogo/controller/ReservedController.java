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

import com.gogo.service.PaymentService;
import com.gogo.service.ReservedService;
import com.gogo.vo.ReservedVO;
import com.gogo.vo.RoomVO;
import com.gogo.vo.StayVO;

@Controller
@RequestMapping("/reserved/*")
public class ReservedController {
	
	@Autowired
	ReservedService service;
	
	@Autowired
	PaymentService service_p;
	
	
	@GetMapping("reserved")
	public void reservation(ReservedVO reserved, Model model) {
		
		// 받아올 데이터가 없기에 일단은 매개변수에서 빼서 여기에 세팅
		//ReservedVO reserved = new ReservedVO();
		
		// 테스트를 위해 임의로 정보 삽입
		// 여기서 예약 페이지에서 보여줄 데이터를 설정한다.
		reserved.setRoomNo("1");
		reserved.setMemberId("user1");
		reserved.setCheckIn("2023/08/06");
		reserved.setCheckOut("2023/08/09");
		reserved.setMemberCount("5");
		
		service.goReserved(reserved, model);
	}
	
	@GetMapping("calendar")
	public void calender() {
		
	}
	
	// 달력 submit시 결과 
	// goReserved 메소드에서 조건 분기를 만들어 달력의 결과를 바꾸자
	@GetMapping("day")
	public String day(@RequestParam("reserved_day") String reserved_day
					, @RequestParam("reserved_checkIn") String reserved_checkIn
					, @RequestParam("reserved_checkOut") String reserved_checkOut
					, ReservedVO reserved
					, Model model) {
		
		System.out.println("reserved.roomNo : "+ reserved.getRoomNo());
		
		System.out.println("총 예약일 : "+reserved_day);
		System.out.println("체크인 : "+reserved_checkIn);
		System.out.println("체크아웃 : "+reserved_checkOut);
				
		reserved.setCheckIn(reserved_checkIn);
		reserved.setCheckOut(reserved_checkOut);
		String res = service.goReserved(reserved, model);
		
		return res;
	}
}
