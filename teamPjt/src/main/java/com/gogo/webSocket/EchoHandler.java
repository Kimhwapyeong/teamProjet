package com.gogo.webSocket;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.gogo.service.MessageService;
import com.gogo.vo.MemberVO;

import org.slf4j.LoggerFactory;



@RequestMapping("/echo")
public class EchoHandler extends TextWebSocketHandler{
    private Map<String, List<WebSocketSession>> roomSessions = new ConcurrentHashMap<>();
    private static Logger logger = LoggerFactory.getLogger(EchoHandler.class);
    
    @Autowired
    MessageService service;
  
 
    @Override
    public void afterConnectionEstablished(WebSocketSession session) throws Exception {
        String roomId = session.getUri().getQuery();

        // roomId가 null인 경우 처리
        if (roomId == null) {
            // 예외를 던지거나, 기본값을 설정합니다.
            throw new Exception("roomId는 null일 수 없습니다.");
        }

        if (!roomSessions.containsKey(roomId)) {
            roomSessions.put(roomId, new ArrayList<>());
        }
        roomSessions.get(roomId).add(session);

        Map<String, Object> map = new HashMap<String, Object>();
        String writer = (String)session.getAttributes().get("memberId");
        MemberVO member = (MemberVO)session.getAttributes().get("member");
        // writer가 null인 경우 처리
        if (writer == null) {
            // 예외를 던지거나, 기본값을 설정합니다.
            throw new Exception("writer는 null일 수 없습니다.");
        }

        System.err.println("writer : "+ writer);
        System.err.println("roomId : "+ roomId);
        System.err.println("member : "+ member);
        
        int idx = roomId.indexOf("=");
        roomId = roomId.substring(idx+1);
        
        service.chattingGet(roomId, member);
        map.put("enterMsg", writer+"님 "+roomId+"번 채팅방 입장!");
        map.put("roomId", roomId);
        map.put("type", "ENTER");
        map.put("writer", writer);
        service.insertChatting(map);

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
            
            // 메시지가 도착할 때마다 메시지를 저장
            Map<String, Object> map = new HashMap<String, Object>();
            String writer = (String) session.getAttributes().get("memberId");

            // writer가 null인 경우 처리
            if (writer == null) {
                // 예외를 던지거나, 기본값을 설정합니다.
                throw new Exception("writer는 null일 수 없습니다.");
            }

            int idx = roomId.indexOf("=");
            roomId = roomId.substring(idx+1);

            map.put("content", message.getPayload());
            map.put("roomId", roomId);
            map.put("type", "TALK");
            map.put("writer", writer);
            service.insertChatting(map);

            
        } else {
            System.err.println("클라이언트가 비어있는 메세지를 send 하였습니다!");
        }
    }

    @Override
    public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
        String roomId = session.getUri().getQuery();
        roomSessions.get(roomId).remove(session);
        // 연결이 끊길 때마다 메시지를 저장
        Map<String, Object> map = new HashMap<String, Object>();
        String writer = (String) session.getAttributes().get("memberId");

        // writer가 null인 경우 처리
        if (writer == null) {
            // 예외를 던지거나, 기본값을 설정합니다.
            throw new Exception("writer는 null일 수 없습니다.");
        }

        int idx = roomId.indexOf("=");
        roomId = roomId.substring(idx+1);

        map.put("content", writer+"님 "+roomId+"번 채팅방 퇴장!");
        map.put("roomId", roomId);
        map.put("type", "OUT");
        map.put("writer", writer);
        service.insertChatting(map);
        logger.info("{} 연결 끊김, roomId: {}", session.getId(), roomId);
    }	
	
	


}
