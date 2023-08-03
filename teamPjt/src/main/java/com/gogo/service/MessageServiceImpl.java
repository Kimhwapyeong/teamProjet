package com.gogo.service;

import java.io.IOException;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import org.apache.ibatis.annotations.ConstructorArgs;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
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




}
