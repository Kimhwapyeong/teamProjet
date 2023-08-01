package com.gogo.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.gogo.service.PaymentService;
import com.gogo.service.ReservedService;
import com.gogo.service.mypageService;
import com.gogo.vo.PaymentVO;
import com.gogo.vo.ReservedVO;
import com.gogo.vo.RoomVO;
import com.gogo.vo.StayVO;

@Controller
@RequestMapping("/member/mypage/*")
public class UserController {
	
	@Autowired
	mypageService service;
	
	@Autowired
	ReservedService service_r;
	
	@Autowired
	PaymentService service_p;
	
	// 예약 정보
	@GetMapping("reservation")
	public void reservation(Model model) {
		service.reservList(model);
	}
	
	// 취소내역
	@GetMapping("cancel")
	public void cancel(Model model) {
		service.cancelList(model);
	}
	
	// 관심 스테이
	@GetMapping("likestay")
	public void likestay() {
		
	}
	
	// 회원 정보 수정
	@GetMapping("info")
	public void info(Model model) {
		service.mem(model);
	}
	
	@PostMapping("infoFrm")
	public void infoFrm() {
		int res;
		
		System.out.println("출력: ");
		String msg = "";
	
	}
		
	// 메세지
	@GetMapping("message")
	public void message() {
		
	}
	
	// 예약 상세 확인
	@GetMapping("reserved_detail")
	public void reserved_detail(@RequestParam("checkIn") String checkIn
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

	
}
