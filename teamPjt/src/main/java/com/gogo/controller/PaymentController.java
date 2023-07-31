package com.gogo.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.gogo.service.PaymentService;

@Controller
@RequestMapping("/payment/*")
public class PaymentController {
	
	
	@Autowired
	PaymentService service;
	
	
	@PostMapping("verify")
	@ResponseBody
	public Map<String, Object> verify(@RequestBody Map<String, Object> rsp) {
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		
		System.out.println("rsp : "+rsp);
		System.out.println("error_code : "+rsp.get("error_code"));
		System.out.println("error_msg : "+rsp.get("error_msg"));
		
		
		return map;
		
	}
		
	
}
	