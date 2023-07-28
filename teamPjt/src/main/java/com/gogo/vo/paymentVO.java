package com.gogo.vo;

import lombok.Data;

@Data // 환불
public class paymentVO {

	private String impUid;	// 환불 및 조회에 필요한 key
	private String reservationNo; // 예약 seq
	private String regDate; // 결제 시간
	private String paymentMethod; // 결제 수단
	private String merchant_uid; // 거래 번호
	private String errorCode; // 에러코드
}
