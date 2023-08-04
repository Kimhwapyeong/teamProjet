package com.gogo.service;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.ConstructorArgs;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.gogo.mapper.MessageMapper;
import com.gogo.vo.MessageVO;
import com.gogo.webSocket.EchoHandler;

@Service
public class MessageServiceImpl implements MessageService{

	
	@Autowired
	MessageMapper messageMapper;

	
	@Override
	public int insertMessage(MessageVO vo) {

		return messageMapper.insertMessage(vo);
	}



	@Override
	public int insertMessageRoom() {
		return messageMapper.insertMessageRoom();
	}
	


	@Override
	public String getRoomId(String roomId) {
		return messageMapper.getRoomId(roomId);
	}
	
	@Override
	public String getNewRoomId() {
		return messageMapper.getNewRoomId();
	}
	@Override
	public int insertMessageRoomCustom(String roomId) {
		return messageMapper.insertMessageRoomCustom(roomId);
	}
	
	@Override
	public void chattingGet(String roomId, HttpSession session, Model model) throws Exception {
		
		int res = insertMessageRoom();
		
		if(res>0) {
			
			String memberId = (String)session.getAttribute("memberId");
			
			// 파라미터가 null이면 위의 insert문에서 사용한 시퀀스를 가져옴(currVal)
			if(roomId==null || "".equals(roomId)) {
				
				roomId = getNewRoomId();
			}
			
			// 체크해서 없는 roomId면 새로 insert
			String check = getRoomId(roomId);
			
			if(check==null || "".equals(check)) {
				
				insertMessageRoomCustom(roomId);
				
			}
			
			
			System.out.println(memberId+"님 "+roomId+"번 채팅방 입장");
			
			String enter = memberId+"님 "+roomId+"번 채팅방 입장";
			
			model.addAttribute("enter", enter);
			model.addAttribute("roomId", roomId);
		} else {
			
		}
		

	}
	
	@Override
	public Map<String, Object> insertChatting(Map<String, Object> map){
		Map<String, Object> result = new HashMap<String, Object>();
		
		System.out.println(map+"호출 성공");
		MessageVO vo = new MessageVO();
		
		if(map.get("enterMsg")!=null && !"".equals(map.get("enterMsg"))) {
			
			vo.setContent(String.valueOf(map.get("enterMsg")));
		} else {
			
			vo.setContent(String.valueOf(map.get("content")));
		}
		
		
		vo.setRegDate(String.valueOf(map.get("regDate")));
		vo.setMemberId(String.valueOf(map.get("writer")));
		vo.setRoomId(String.valueOf(map.get("roomId")));
		vo.setType(String.valueOf(map.get("type")));
		int res = insertMessage(vo);
		
		if(res>0) {
			System.out.println("메세지 vo 저장 성공");
			result.put("vo", vo);
			result.put("msg", "메세지 저장 성공");
		} else {
			System.out.println("메세지 vo 저장 실패!");
			result.put("msg", "메세지 저장 실패");
		}
		return result;

	}







}
