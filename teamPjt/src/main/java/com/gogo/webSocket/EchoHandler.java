package com.gogo.webSocket;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;


import org.slf4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.fasterxml.jackson.databind.ObjectMapper;

import com.gogo.service.MessageService;
import com.gogo.service.ReservedService;
import com.gogo.vo.MemberVO;
import com.gogo.vo.MessageRoomVO;
import com.gogo.vo.MessageVO;
import com.gogo.vo.StayVO;

import org.slf4j.LoggerFactory;



@RequestMapping("/echo")
public class EchoHandler extends TextWebSocketHandler{
    private Map<String, List<WebSocketSession>> roomSessions = new ConcurrentHashMap<>();
    private Map<String, WebSocketSession> userSessions = new ConcurrentHashMap<>(); // 사용자 세션을 관리하기 위한 Map 추가
    private Map<String, WebSocketSession> roomUpdateSessions = new ConcurrentHashMap<>();  // 실시간 리스트 업데이트를 위한 세션을 저장하는 맵
    private static Logger logger = LoggerFactory.getLogger(EchoHandler.class);
    
    @Autowired
    MessageService service;
    @Autowired
    ReservedService service_reserved;
    
    
    
    @Override
    public void afterConnectionEstablished(WebSocketSession session) throws Exception {
        String writer = (String) session.getAttributes().get("memberId");
        String queryString = session.getUri().getQuery();
        
        

        // Query String에서 targetMemberId 파라미터 값을 추출
        Map<String, String> params = parseQueryString(queryString);
        String targetMemberId = params.get("targetMemberId");
        
        String socketType = params.get("socketType");
        
        if ("updateRooms".equals(socketType)) {
            roomUpdateSessions.put(writer, session);
        }
        //System.out.println("socketType : "+socketType );
        
        
        // targetMemberId 기반으로 사용자 세션을 관리
        if (targetMemberId != null && targetMemberId.equals(writer)) {
            userSessions.put(targetMemberId, session);
        }

        //String roomId = params.get("roomId");  // 이 부분은 roomId가 필요할 때 사용하면 됩니다.     
        //userSessions.put(writer, session); // 사용자 세션 등록
    	
    	
    	String roomId = (String) session.getAttributes().get("roomId");
    	 String stayNoMsg = (String) session.getAttributes().get("stayNoMsg");
        // roomId가 null인 경우 처리
        
        System.out.println("씨발!!"+ stayNoMsg);

        if (!roomSessions.containsKey(roomId)) {
            roomSessions.put(roomId, new ArrayList<>());
        }
        roomSessions.get(roomId).add(session);

        Map<String, Object> map = new HashMap<String, Object>();
        MemberVO member = (MemberVO)session.getAttributes().get("member");
        // writer가 null인 경우 처리
        if (writer == null) {
            // 예외를 던지거나, 기본값을 설정합니다.
            throw new Exception("writer는 null일 수 없습니다.");
            
        }

//        System.err.println("writer : "+ writer);
//        System.err.println("roomId : "+ roomId);
//        System.err.println("member : "+ member);
//        
        int idx = roomId.indexOf("=");
        roomId = roomId.substring(idx+1);
        
        if(session.getAttributes().get("memberId")!=null) {
        	
        	MessageVO checkMsg = new MessageVO();
        	checkMsg.setMemberId((String)session.getAttributes().get("memberId"));
        	checkMsg.setRoomId(roomId);
	        	if(service.joinYN(checkMsg) && "chat".equals(socketType)) {
	        		
	        		service.chattingGet(roomId, member);
	        		map.put("content", writer+"님 "+roomId+"번 채팅방 입장!");
	        		map.put("roomId", roomId);
	        		map.put("type", "ENTER");
	        		map.put("writer", writer);
	        		map.put("stayNoMsg", stayNoMsg);
	        		service.insertChatting(map);
	        	}
        }

        logger.info("{} 연결됨, roomId: {}", session.getId(), roomId);
    }

    @Override
    protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
    	
    	
    	if (message != null && message.getPayload() != null) {
            String roomId = (String) session.getAttributes().get("roomId");
            logger.info("{}로 부터 {}받음, roomId: {}", session.getId(), message.getPayload(), roomId);
            List<WebSocketSession> sessionsInRoom = roomSessions.get(roomId);
            for (WebSocketSession sess : sessionsInRoom) {
            	
            	if(sess != null && !"".equals(sess)) {
            		if(sess.isOpen()) {
            			
            			sess.sendMessage(new TextMessage(message.getPayload()));
            		} else {
            			
            			sessionsInRoom.remove(sess);
            		}
            	}
            	
            }

            // 메시지가 도착할 때마다 메시지를 저장
            Map<String, Object> map = new HashMap<String, Object>();
            String writer = (String) session.getAttributes().get("memberId");
            String stayNoMsg = (String) session.getAttributes().get("stayNoMsg");
            // writer가 null인 경우 처리
            if (writer == null) {
                // 예외를 던지거나, 기본값을 설정합니다.
                throw new Exception("writer는 null일 수 없습니다.");
                
            }
            
            

            int idx = roomId.indexOf("=");
            roomId = roomId.substring(idx+1);

            if (!"undefined".equals(roomId)) {  // roomId가 undefined가 아닐 때만 실행
                map.put("content", message.getPayload());
                map.put("roomId", roomId);
                map.put("type", "TALK");
                map.put("writer", writer);
                map.put("stayNoMsg", stayNoMsg);
                service.insertChatting(map);
            } 
            
            if(message.getPayload().contains("ENTER")) {
            	
            	sendUpdatedRoomList(session);
            }
            
        
        } else {
            System.err.println("클라이언트가 비어있는 메세지를 send 하였습니다!");
        }
        
    }
    @Override
    public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
    	String roomId = "";
    	try {
		    	String writer = (String) session.getAttributes().get("memberId");
		        userSessions.remove(writer); // 사용자 세션 제거
		        
		        String queryString = session.getUri().getQuery();

		        // Query String에서 targetMemberId 파라미터 값을 추출
		        Map<String, String> params = parseQueryString(queryString);
		        String socketType = params.get("socketType");
		        //System.err.println("socketType : "+socketType);
		
		        roomId = (String) session.getAttributes().get("roomId");
		        
		        String stayNoMsg = (String) session.getAttributes().get("stayNoMsg");
		        
		       
		        roomSessions.get(roomId).remove(session);
		        // roomId가 null인 경우 처리

		        
		        int idx = roomId.indexOf("=");
		        roomId = roomId.substring(idx+1);
		        
		        // writer가 null인 경우 처리
		        if (writer == null) {
		            // 예외를 던지거나, 기본값을 설정합니다.
		            throw new Exception("writer는 null일 수 없습니다.");
		        }
		        	
		        Map<String, Object> map = new HashMap<String, Object>();
		        
		       if(session.getAttributes().get("memberId")!=null) {
		        	//System.err.println("웹소켓 연결 닫힘 횟수 테스트");
		        	MessageVO checkMsg = new MessageVO();
		        	checkMsg.setMemberId((String)session.getAttributes().get("memberId"));
		        	checkMsg.setRoomId(roomId);
			        	if(service.joinYN2(checkMsg) && "chat".equals(socketType)) {
			        		
			        		map.put("content", writer+"님 "+roomId+"번 채팅방 퇴장!");
			        		map.put("roomId", roomId);
			        		map.put("type", "OUT");
			        		map.put("writer", writer);
			        		map.put("stayNo", stayNoMsg);
			        		map.put("stayNoMsg", stayNoMsg);
			        		service.insertChatting(map);
			        	}
		        }
    	} catch (Exception e) {
    		return;
    	}
       
        logger.info("{} 연결 끊김, roomId: {}", session.getId(), roomId);
    }	
    public void sendInviteNotification(String senderId, String targetMemberId, String roomId) throws IOException {
        WebSocketSession targetSession = userSessions.get(targetMemberId);

        if (targetSession != null && targetSession.isOpen() && !senderId.equals(targetMemberId)) {
        	
        	String stayNoMsg = service.getStayNoMsg(roomId);
        	
            Map<String, String> payload = new HashMap<>();
            payload.put("type", "invite");
            
            // 여기에서 초대 메시지를 생성합니다.
            String inviteMessage = senderId + "님이 " + roomId + "번 방에 초대하였습니다.";
            
            payload.put("stayNoMsg", stayNoMsg);
            payload.put("message", inviteMessage);
            payload.put("roomId", roomId);

            TextMessage message = new TextMessage(new ObjectMapper().writeValueAsString(payload));
            targetSession.sendMessage(message);
        }
    }    
    private Map<String, String> parseQueryString(String queryString) {
        Map<String, String> map = new HashMap<>();
        if (queryString == null || queryString.isEmpty()) {
            return  map;
        }

        String[] pairs = queryString.split("&");
        for (String pair : pairs) {
            int idx = pair.indexOf("=");
            if (idx > 0 && pair.length() > idx+1) {
                map.put(pair.substring(0, idx), pair.substring(idx+1));
            }
        }
        return map;
    }
    

    private void sendUpdatedRoomList(WebSocketSession session) throws IOException {
        
        String stayNo = (String)session.getAttributes().get("stayNoMsg");
        int pageNo = session.getAttributes().containsKey("hostMsgPageNo") && session.getAttributes().get("hostMsgPageNo") != null 
                        ? (int)session.getAttributes().get("hostMsgPageNo") : 1;

        StayVO stay = service_reserved.selectOne_stay(stayNo);
        String memberId = stay.getMemberId();

        System.err.println("핸들러 memberId : "+memberId);
        System.err.println("핸들러 pageNo : "+pageNo);

        List<MessageRoomVO> updatedRooms = service.messageRoomList(memberId, pageNo); // 방 목록을 가져오는 서비스 로직
        System.err.println("핸들러 updatedRooms"+updatedRooms);

        Map<String, Object> map = new HashMap<>();
        map.put("type", "ROOM_UPDATE");
        map.put("rooms", updatedRooms);

        String messagePayload = new ObjectMapper().writeValueAsString(map);

        // Send to all connected clients
        for (WebSocketSession currentSession : roomUpdateSessions.values()) {
        
        if(currentSession!=null && !"".equals(currentSession))
            if (currentSession.isOpen()) {
                currentSession.sendMessage(new TextMessage(messagePayload));
            }
        }
    }


}
