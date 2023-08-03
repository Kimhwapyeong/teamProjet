package com.gogo.service;


import org.springframework.stereotype.Service;
import org.springframework.web.socket.WebSocketSession;

import com.gogo.vo.MessageVO;

@Service
public interface MessageService {



	
	public int insertMessage(MessageVO vo);
	public int insertMessageRoom();
	public String getRoomId(String roomId);


}
