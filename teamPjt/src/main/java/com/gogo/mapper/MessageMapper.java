package com.gogo.mapper;

import java.util.List;

import com.gogo.vo.MessageRoomVO;
import com.gogo.vo.MessageVO;

public interface MessageMapper {
	
	
	public int insertMessage(MessageVO vo);
	public List<MessageVO> getList(String roomId);
	
	public int insertMessageRoom(); 
	public int insertMessageRoomCustom(String roomId);
	
	
	public String getRoomId(String roomId);
	
	public String getNewRoomId();
	
	
}
