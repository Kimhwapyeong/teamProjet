package com.gogo.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.gogo.service.StayService;

@Controller
@RequestMapping("/stay/*")
public class StayController {

	@Autowired
	StayService stayService;
	
	@GetMapping("list")
	public void getList() {
	}
	
	@GetMapping("room")
	public void room() {
		
	}
}
