package com.gogo.vo;

import lombok.Data;

@Data
public class StayVO {

	private String stayNo; // 숙소 시퀀스
	private String stayName;
	private String memberId; // 호스트 아이디
	private String stayLoc; // 숙소 위치 (지역 명)
	private String stayAdress;
	private String stayInfo; // 숙소 설명
	private String stayType; // 분류
	private String bedge;
	private String mainPic1; // 메인사진 1
	private String mainPic2; // 메인사진 2
	
	// 위도, 경도는 카카오맵 api 사용 시 지도에 마커로 표시할 때 사용됨
	private int logitude; 	// 위도
	private int longitude;	// 경도
}
