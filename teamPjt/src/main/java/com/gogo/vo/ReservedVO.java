package com.gogo.vo;

import lombok.Data;

@Data  // 예약
public class ReservedVO {

	private String reservationNo; // 예약 seq
	private String roomNo; // room seq
	private String memberId;
	private String regDate; // 예약일
	private String checkIn; // 체크인 날짜
	private String checkOut; // 체크아웃 날짜
	private String memberCount; // 예약 인원
}
