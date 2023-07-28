package com.gogo.vo;

import lombok.Data;

@Data // 질문
public class QuestionVO {
	
	private String queNo; // 질문 seq
	private String memberId;
	private String title;
	private String content;
	private String contentDate; // 게시일
}
