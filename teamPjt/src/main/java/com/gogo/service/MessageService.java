package com.gogo.service;


import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.socket.WebSocketSession;

import com.gogo.vo.MemberVO;
import com.gogo.vo.MessageVO;

@Service
public interface MessageService {



	
	public int insertMessage(MessageVO vo);
	public int insertMessageRoom();
	public int insertMessageRoomCustom(String roomId);
	public String getRoomId(String roomId);
	public void chattingGet(String roomId, HttpSession session, Model model) throws Exception;
	public void chattingGet(String roomId, MemberVO member) throws Exception;
	public Map<String, Object> insertChatting(Map<String, Object> map);
	public String getNewRoomId();


}
