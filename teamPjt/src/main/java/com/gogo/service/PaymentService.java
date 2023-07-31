package com.gogo.service;

import org.springframework.stereotype.Service;

import com.gogo.vo.PaymentVO;

@Service
public interface PaymentService {
	
	public int insertPayment(PaymentVO vo);
	public PaymentVO selectOne(String impUid);
}
