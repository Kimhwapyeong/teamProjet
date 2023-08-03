package com.gogo.webSocket;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.fasterxml.jackson.databind.ObjectMapper;

import org.slf4j.LoggerFactory;



@RequestMapping("/echo")
public class EchoHandler extends TextWebSocketHandler{
	
	
	// 세션 리스트
	private List<WebSocketSession> sessionList = new ArrayList<WebSocketSession>();
	private static Logger logger = LoggerFactory.getLogger(EchoHandler.class);
	
	// 클라이언트가 연결 되었을 때 실행
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception{
		
		sessionList.add(session);
		logger.info("{} 연결됨", session.getId());
		System.err.println(session.getRemoteAddress());
		
	}
	
	// 클라이언트가 웹 소켓 서버로 메세지를 전송했을때 실행
	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception{
		
		logger.info("{}로 부터 {}받음", session.getId(), message.getPayload());
		// 모든 유저에게 메세지 출력
		for(WebSocketSession sess : sessionList) {
			sess.sendMessage(new TextMessage(message.getPayload()));
		}
	}
	
	
	
	
	// 클라이언트 연결을 끊었을때 실행
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		sessionList.remove(session);
		logger.info("{} 연결 끊김", session.getId());
	}

}
