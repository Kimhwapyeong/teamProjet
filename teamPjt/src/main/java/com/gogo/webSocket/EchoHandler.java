package com.gogo.webSocket;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

import org.slf4j.Logger;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;


import org.slf4j.LoggerFactory;



@RequestMapping("/echo")
public class EchoHandler extends TextWebSocketHandler{
    private Map<String, List<WebSocketSession>> roomSessions = new ConcurrentHashMap<>();
    private static Logger logger = LoggerFactory.getLogger(EchoHandler.class);
    
    @Override
    public void afterConnectionEstablished(WebSocketSession session) throws Exception {
        String roomId = session.getUri().getQuery();
        if (!roomSessions.containsKey(roomId)) {
            roomSessions.put(roomId, new ArrayList<>());
        }
        roomSessions.get(roomId).add(session);
        logger.info("{} 연결됨, roomId: {}", session.getId(), roomId);
    }

    @Override
    protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
        if (message != null && message.getPayload() != null) {
            String roomId = session.getUri().getQuery();
            logger.info("{}로 부터 {}받음, roomId: {}", session.getId(), message.getPayload(), roomId);
            List<WebSocketSession> sessionsInRoom = roomSessions.get(roomId);
            for (WebSocketSession sess : sessionsInRoom) {
                sess.sendMessage(new TextMessage(message.getPayload()));
            }
        } else {
            System.err.println("클라이언트가 비어있는 메세지를 send 하였습니다!");
        }
    }
    
    @Override
    public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
        String roomId = session.getUri().getQuery();
        roomSessions.get(roomId).remove(session);
        logger.info("{} 연결 끊김, roomId: {}", session.getId(), roomId);
    }	
	
	


}
