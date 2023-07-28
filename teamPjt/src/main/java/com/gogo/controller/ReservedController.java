package com.gogo.controller;

import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/reserved/*")
public class ReservedController {

	@GetMapping("reserved")
	public void reservation() {
		
	}
	
	@GetMapping("calendar")
	public void calender() {
		
	}
	
	@PostMapping("verify")
	@ResponseBody
	public void verify(@RequestBody Map<String, Object> rsp) {
		
		System.out.println("rsp : "+rsp);
		System.out.println("error_code : "+rsp.get("error_code"));
		System.out.println("error_msg : "+rsp.get("error_msg"));
		
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
