package com.gogo.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class MainController {

	@GetMapping("/main")
	public void getMain() {
		
	}
	
	// 매핑용
	@GetMapping("/add")
	public String addStay() {
		
		return "/stay/add";
	}

}
