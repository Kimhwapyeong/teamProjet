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
		
		// 테스트를 위해 임의로 정보 삽입
		// 여기서 예약 페이지에서 보여줄 데이터를 설정한다.
		reserved.setRoomNo("2");
		reserved.setMemberId("user1");
		reserved.setCheckIn("2023/08/21");
		reserved.setCheckOut("2023/08/23");
		reserved.setMemberCount("3");
		
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
					, @RequestParam("btnYN") String btnYN
					, ReservedVO reserved
					, Model model) {
		
		System.out.println("btnYN : "+btnYN);
		System.out.println("reserved.roomNo : "+ reserved.getRoomNo());
		
		System.out.println("총 예약일 : "+reserved_day);
		System.out.println("체크인 : "+reserved_checkIn);
		System.out.println("체크아웃 : "+reserved_checkOut);
				
		reserved.setCheckIn(reserved_checkIn);
		reserved.setCheckOut(reserved_checkOut);
		String res =service.goReserved(reserved, model);
		
		if("search".equals(btnYN)) {
			res = "/stay/list";
		} else {
			res = "/reserved/reserved";
		}
		
		return res;
	}
	
	// 예약 상세 확인
	@GetMapping("reserved_detail")
	public void reserved_detail() {
		
	}
	
}
