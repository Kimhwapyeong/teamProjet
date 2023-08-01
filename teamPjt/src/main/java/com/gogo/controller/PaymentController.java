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
import com.gogo.service.RefundService;
import com.gogo.service.ReservedService;
import com.gogo.vo.PaymentVO;
import com.gogo.vo.RefundVO;
import com.gogo.vo.ReservedVO;
import com.siot.IamportRestClient.response.IamportResponse;
import com.siot.IamportRestClient.response.Payment;

@Controller
@RequestMapping("/payment/*")
public class PaymentController {
	
	
	@Autowired
	PaymentService service;
	
	@Autowired
	ReservedService service_r;
	
	@Autowired
	RefundService service_re;
	
	
	
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
	
	@PostMapping("payInfoAction")
	public @ResponseBody Map<String, Object> payInfoAction(@RequestBody String imp_uid) {
		
		System.out.println(imp_uid);
		
		Map<String, Object> map = new HashMap<String, Object>();
		PaymentVO vo = service.selectOne(imp_uid);
		
		if(vo==null) {
			System.out.println("해당 결제 정보를 찾을 수 없습니다.");
			map.put("message", "해당 결제 정보를 찾을 수 없습니다.");
			return map;
		}
		
		
		System.out.println(vo.getPaymentNo());
		System.out.println(vo.getPaymentMethod());
		System.out.println(vo.getImpUid());
		System.out.println(vo.getReservationNo());
		System.out.println(vo.getCancleYN());
		
		map.put("vo", vo);
		
		return map;
	}
	
	@PostMapping("canclePay/{checksum}")
	public @ResponseBody String canclePay(@RequestBody Map<String, Object> data
											, @PathVariable String checksum) throws Exception {
		
		String res = "";
		
		if(data!=null) {
			String token = service.getToken();
			String imp_uid = (String)data.get("imp_uid");
			Object price = data.get("cancel_request_amount");
			
			
			
			System.out.println("canclepay : "+checksum);
			
			// 환불 금액 걍 조작 가능ㅋ
			String refundPrice = String.valueOf(price);
			res = service.payMentCancle(token, imp_uid, refundPrice, "환불이다!", checksum);
			
			if("success".equals(res)) {
				
				System.out.println("cancleYN 수정 완료");
				service.updateCancle(imp_uid);
				
				
				PaymentVO pay = service.selectOne(imp_uid);
				RefundVO check = service_re.selectOne(pay.getPaymentNo());
				
				if(check==null) {
					
					RefundVO vo = new RefundVO();
					
					vo.setPaymentNo(pay.getPaymentNo());
					vo.setAmount(pay.getAmount());
					vo.setFee("0");
					
					service_re.insertRefund(vo);
				} else {
					
					res = "dup";
				}
				
				
				
			} else {
				System.out.println("cancleYN 수정 실패..");
			}
		}
		
		
		// 어차피 return에 성공/실패 유무가 담겨있다.
		return res;
	}

	
}
	