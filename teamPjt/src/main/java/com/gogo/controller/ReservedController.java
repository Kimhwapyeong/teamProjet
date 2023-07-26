package com.gogo.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/reserved/*")
public class ReservedController {

	@GetMapping("reserved")
	public void reservation() {
		
	}
}
