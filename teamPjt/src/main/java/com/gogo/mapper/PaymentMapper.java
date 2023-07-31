package com.gogo.mapper;

import com.gogo.vo.PaymentVO;

public interface PaymentMapper {
	
	
	public int insertPayment(PaymentVO vo);
	
	public PaymentVO selectOne(String impUid);
	
	public String getUid();
	
	public int updateError(PaymentVO vo);
}
