package com.gogo.vo;

import lombok.Data;

@Data // 환불
public class refundVO {

	private String refundNo; // 환불 seq
	private String impUid;
	private String amount; // 환불 가격
	private String regDate; // 환불 날짜
	private String fee; // 환불 수수료
	
}
