package com.gogo.controller;

import java.util.HashMap;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.gogo.service.PaymentService;
import com.gogo.service.ReservedService;
import com.gogo.vo.PaymentVO;
import com.gogo.vo.ReservedVO;
import com.siot.IamportRestClient.IamportClient;
import com.siot.IamportRestClient.response.IamportResponse;
import com.siot.IamportRestClient.response.Payment;

@Controller
@RequestMapping("/payment/*")
public class PaymentController {
	
	
	@Autowired
	PaymentService service;
	
	@Autowired
	ReservedService service_r;
	
	
	// 결제 도중에(DB에 저장되기 전) 결제 정보 가져오기!
	@PostMapping("verify/{imp_uid}")
	@ResponseBody
	public IamportResponse<Payment> paymentByImpUid(Model model
													, Locale locale
													, HttpSession session
													, @PathVariable("imp_uid") String imp_uid
													, @RequestBody Map<String, Object> map) throws Exception{
		
		return service.verify(model, locale, session, imp_uid, map);
		
	}
}
	