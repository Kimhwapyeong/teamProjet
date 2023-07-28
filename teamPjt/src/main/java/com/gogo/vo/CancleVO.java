package com.gogo.vo;

import lombok.Data;

@Data	// 예약 취소
public class CancleVO {

	private String ReservationNo; // 예약 seq
	private String cancleDate; // 취소일
}
