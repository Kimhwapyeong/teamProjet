package com.gogo.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class MainController {

	@GetMapping("/main")
	public void getMain() {
		
	}
	
	// 임시 매핑용
	@GetMapping("/addstay")
	public String addStay() {
		
		return "/stay/addstay";
	}
	
	// 임시 매핑용
	@GetMapping("/addroom")
	public String addRoom() {
		
		return "/stay/addroom";
	}
	
	// 임시 매핑용
	@GetMapping("/editstay")
	public String editStay() {
		
		return "stay/editstay";
	}

	// 임시 매핑용
	@GetMapping("/editroom")
	public String editRoom() {
		
		return "stay/editroom";
	}

}
